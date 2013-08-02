authorization do
    role :superadmin do
        has_permission_on :transaction_fields, :to => [:index, :create, :read, :update, :destroy, :new, :show, :search, :edit]
        has_permission_on :transactions, :to => [:index, :create, :read, :update, :destroy, :show, :search, :edit, :get_partial_payments]
        has_permission_on :leads, :to => [:index, :create, :read, :update, :destroy, :new, :show, :search, :edit, :postpone_lead]
        has_permission_on :products, :to => [:index, :create, :read, :update, :destroy, :new, :show, :search, :edit]
        has_permission_on :users, :to => [:index, :create, :read, :update, :destroy, :new, :show, :edit]
        has_permission_on :crm_customers, :to => [:index, :create, :read, :update, :destroy, :new, :show, :edit]
        has_permission_on :companies , :to => [:index, :create, :read, :update, :destroy, :new, :show, :edit]
        has_permission_on :tags, :to => [:index, :create, :read, :update, :destroy, :new, :show, :edit, :search]
        has_permission_on :sales_executives, :to => [:index, :create, :read, :update, :destroy, :new, :show, :edit]
        has_permission_on :team_leaders, :to => [:index, :create, :read, :update, :destroy, :new, :show, :edit]
        has_permission_on :events, :to => [:index, :create, :read, :update, :destroy, :new, :show, :search, :edit]
        has_permission_on :notifications, :to => [:index, :create, :read, :update, :destroy, :new, :show, :search, :edit, :noticed]
        has_permission_on :targets, :to => [:index, :create, :read, :update, :destroy, :new, :show, :search, :edit, :old_target]
        has_permission_on :contacts, :to => [:index, :create, :read, :update, :destroy, :new, :show, :search, :edit, :map_index]
        has_permission_on :calendar, :to => [:index]
    end

    role :admin do
        has_permission_on :leads, :to => [:index, :create, :read, :update, :destroy, :new, :show, :search, :edit, :change_owner, :postpone_lead]
        has_permission_on :accounts, :to => [:index, :create, :read, :update, :destroy, :new, :show, :search, :edit]
        has_permission_on :inventories, :to => [:index, :read, :destroy, :show]
        has_permission_on :inventory_additions, :to => [:new, :create, :show]
        has_permission_on :transactions, :to => [:index, :create, :read, :update, :destroy, :show, :search, :edit, :mature, :graph, :invoice, :create_transaction, :new, :get_partial_payments]
        has_permission_on :products, :to => [:index, :create, :read, :update, :destroy, :new, :show, :search, :edit]
        has_permission_on :users, :to => [:index, :create, :read, :update, :destroy, :new, :show, :edit]
        has_permission_on :tags, :to => [:index, :create, :read, :update, :destroy, :new, :show, :edit, :search]
        has_permission_on :sales_executives, :to => [:index, :create, :read, :update, :destroy, :new, :show, :edit]
        has_permission_on :team_leaders, :to => [:index, :create, :read, :update, :destroy, :new, :show, :edit, :target_forecast]
        has_permission_on :events, :to => [:index, :create, :read, :update, :destroy, :new, :show, :search, :edit, :create_event]
        has_permission_on :notifications, :to => [:index, :create, :read, :update, :destroy, :new, :show, :search, :edit, :noticed, :notifications_to_all, :create_notification]
        has_permission_on :targets, :to => [:index, :create, :read, :update, :destroy, :new, :show, :search, :edit, :old_target]
        has_permission_on :contacts, :to => [:index, :create, :read, :update, :destroy, :show, :search, :edit, :map_index, :create_contact]
        has_permission_on :calendar, :to => [:index]
        #has_permission_on :employees, :to => [:index, :create, :read, :update, :destroy, :new, :show]
    end

    role :team_leader do
        has_permission_on :leads, :to => [:index, :create, :read, :update, :destroy, :new, :show, :search, :postpone_lead]
        has_permission_on :accounts, :to => [:index, :create, :read, :show, :search]
        has_permission_on :transactions, :to => [:mature, :new]
        has_permission_on :sales_executives, :to => [:index, :create, :read, :update, :destroy, :new, :show]
        has_permission_on :contacts, :to => [:index, :create, :read, :update, :show, :search, :edit]
        has_permission_on :events, :to => [:index, :create, :read, :update, :destroy, :new, :show, :search, :edit]
        has_permission_on :notifications, :to => [:index, :create, :read, :update, :destroy, :new, :show, :search, :edit, :noticed]
        has_permission_on :calendar, :to => [:index]
        has_permission_on :targets, :to => [:index]
    end

    role :sales_executive do
        has_permission_on :leads, :to => [:index, :create, :read, :update, :destroy, :new, :show, :search, :postpone_lead, :mature]
        has_permission_on :accounts, :to => [:index, :create, :read, :show, :search]
        has_permission_on :transactions, :to => [:mature, :new]
        has_permission_on :contacts, :to => [:index, :create, :read, :update, :show, :search, :edit]
        has_permission_on :events, :to => [:index, :create, :read, :update, :destroy, :new, :show, :search, :edit]
        has_permission_on :notifications, :to => [:index, :create, :read, :update, :destroy, :new, :show, :search, :edit, :noticed]
        has_permission_on :calendar, :to => [:index]
        has_permission_on :targets, :to => [:index]
        has_permission_on :contacts, :to => [:index, :create, :read, :update, :new, :show, :search, :edit]
    end
end
