class NotificationsController < ApplicationController
    before_filter :authenticate_user!
    filter_access_to :all
    layout :choose_layout

    def choose_layout
        if action_name == 'search'
            false
        else
            'application'
        end
    end
    # GET /notifications
    # GET /notifications.json
    def index
        if current_user.account_type == 1
          if params[:type] == "old"
            @notifications = Notification.old_notifications(current_user.company_id).paginate(:page => params[:page], :per_page => 15)
          elsif params[:type] == "current"
              @notifications = Notification.current_notifications(current_user.company_id).paginate(:page => params[:page], :per_page => 15)
          elsif params[:type] == "future"
            @notifications = Notification.future_notifications(current_user.company_id).paginate(:page => params[:page], :per_page => 15)
          end
        end

        respond_to do |format|
            format.html # index.html.erb
            format.json { render json: @notifications }
        end
    end

    # GET /notifications/1
    # GET /notifications/1.json
    def show
        @notification = Notification.find(params[:id])

        respond_to do |format|
            format.html # show.html.erb
            format.json { render json: @notification }
        end
    end

    # GET /notifications/new
    # GET /notifications/new.json
    def new
        @company = Company.where(:id => current_user.company_id).first
        @notification = Notification.new
        @contacts = @company.contacts.all

        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @notification }
        end
    end

    # GET /notifications/1/edit
    def edit
        @company = Company.where(:id => current_user.company_id).first
        @notification = Notification.find(params[:id])
        @contacts = @company.contacts.all
    end

    # POST /notifications
    # POST /notifications.json
    def create
        @company = Company.where(:id => current_user.company_id).first
        @notification = @company.notifications.new(params[:notification])
        @contacts = @company.contacts.all

        unless params[:Next_Notification].empty?
        @notification2 = @company.notifications.new(params[:notification])
        @notification2.notification_time = @notification2.notification_time + params[:Next_Notification].to_i.month
        @notification.company_id = @company.id
        @notification2.company_id = @company.id
        end

        respond_to do |format|
            if @notification.save
                if @notification.is_sms
                    @notification.sms_send
                end
                if @notification.is_email
                    @notification.email_send(current_user.id)
                end
                if params[:Next_Notification].empty? == true
                else
                    @notification2.save
                    @notification2.sms_send
                end
                format.html { redirect_to :controller=>"notifications", :action=>"index", :type=>"current", notice: 'Notification was successfully created.' }
                format.json { render json: @notification, status: :created, location: @notification }
            else
                format.html { render action: "new" }
                format.json { render json: @notification.errors, status: :unprocessable_entity }
            end
        end
    end

    # PUT /notifications/1
    # PUT /notifications/1.json
    def update
        @company = Company.where(:id => current_user.company_id).first
        @notification = @company.notifications.find(params[:id])
        @contacts = @company.contacts.all

        respond_to do |format|
            if @notification.update_attributes(params[:notification])
                format.html { redirect_to @notification, notice: 'Notification was successfully updated.' }
                format.json { head :no_content }
            else
                format.html { render action: "edit" }
                format.json { render json: @notification.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /notifications/1
    # DELETE /notifications/1.json
    def destroy
        @notification = Notification.find(params[:id])
        @notification.destroy

        respond_to do |format|
            format.html { redirect_to notifications_url }
            format.json { head :no_content }
        end
    end

    def noticed
        respond_to do |format|
            format.html
            format.json { render json: @notification }
        end
    end

    def search
        if current_user.account_type == 1
            unless params[:q].empty?
                @notifications = Notification.search params[:q], :with => {:company_id => current_user.company_id}
            else
                @notifications = Notification.all
            end
        end
        respond_to do |format|
            format.html
            format.json { head :no_content }
        end
    end

    def notifications_to_all
        if request.get?
            @notification = Notification.new
        elsif request.post?
            @contacts = Company.find(current_user.company_id).contacts
            @contacts.each do |contact|
                Notification.create(:contact_id => contact.id, :body => params[:body], :notification_time => params[:notification_time], :company_id => current_user.company_id)
            end
            redirect_to :notifications, notice: 'Notifications created for all contacts.'
        end
    end

    def create_notification
        @notification = Notification.new(:is_email => 0, :is_sms => 0)
        @notification = Notification.new(:contact_id =>params[:contact_id], :subject => params[:subject], :body => params[:body], :notification_time => params[:notification_time], :is_email => params[:is_email], :is_sms => params[:is_sms])
        @notification.company_id = current_user.company.id
        @notification.save
    end
end
