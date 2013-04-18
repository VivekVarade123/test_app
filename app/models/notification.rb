class Notification < ActiveRecord::Base
  attr_accessible :body, :contact_id, :sms_sent, :notification_time
  belongs_to :contacts

  def sms_send(contact_number, body)
      @sms_gateway_username = "wave"
      @sms_gateway_password = "1492407050"
      @sms_sender_name = "wave"
      @sms_receiver_number = contact_number #8888884083
      @sms_message = URI::encode(body)
      @sms_api_url = "http://bulksms.mysmsmantra.com:8080/WebSMS/SMSAPI.jsp?username=#{@sms_gateway_username}&password=#{@sms_gateway_password}&sendername=#{@sms_sender_name}&mobileno=#{@sms_receiver_number}&message=#{@sms_message}"

      #if cur_request.length > 1000
      response = Net::HTTP.get_response(URI.parse(@sms_api_url))
      puts response
      #end

      #if request.length < cur_request.length
      #  response = Net::HTTP.get_response(URI.parse(cur_request))
      #end
      puts @sms_api_url
  end

  def as_json(options = {})
      {
          :id => self.id,
          :type => "notification",
          :title => self.body,
          :description => "",
          :start => self.notification_time,
          :end => self.notification_time,
          :allDay => "",
          :url => Rails.application.routes.url_helpers.notification_path(id)
      }
  end
end
