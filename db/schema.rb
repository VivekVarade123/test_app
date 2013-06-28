# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130627083057) do

  create_table "accounts", :force => true do |t|
    t.integer  "account_owner"
    t.string   "account_name"
    t.integer  "number_of_employees"
    t.integer  "phone_number"
    t.string   "website"
    t.string   "ownership_type"
    t.string   "billing_address"
    t.string   "shipping_address"
    t.integer  "company_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.boolean  "is_matured"
    t.integer  "lead_id"
  end

  add_index "accounts", ["company_id"], :name => "index_accounts_on_company_id"

  create_table "call_logs", :force => true do |t|
    t.string   "call_result"
    t.string   "subject"
    t.string   "call_type"
    t.string   "call_purpose"
    t.datetime "call_start_time"
    t.integer  "call_duration"
    t.integer  "call_owner_id"
    t.integer  "lead_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "company_name"
    t.string   "company_address"
    t.integer  "contact_number1"
    t.integer  "contact_number2"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "crm_customer_id"
  end

  create_table "contacts", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "address"
    t.integer  "mobile_no"
    t.integer  "landline_no"
    t.string   "contactable_type"
    t.integer  "contactable_id"
    t.integer  "company_id"
    t.boolean  "gmaps"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "email_id"
    t.string   "contact_relationship"
    t.integer  "account_id"
  end

  create_table "crm_customers", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "address"
    t.float    "amount_paid"
    t.date     "subscription_start"
    t.date     "subscription_ends"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "customer_type"
  end

  create_table "employees", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.integer  "mobile_no"
    t.string   "address"
    t.integer  "age"
    t.integer  "team_leader_id"
    t.integer  "sales_executve_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.datetime "starts_at"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "lead_id"
    t.integer  "contact_id"
  end

  add_index "events", ["company_id"], :name => "index_events_on_company_id"
  add_index "events", ["user_id"], :name => "index_events_on_user_id"

  create_table "inventories", :force => true do |t|
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "company_id"
  end

  create_table "inventory_additions", :force => true do |t|
    t.integer  "product_id"
    t.datetime "addition_date"
    t.integer  "quantity"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "company_id"
    t.integer  "inventory_id"
  end

  create_table "leads", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "leadable_id"
    t.string   "leadable_type"
    t.boolean  "matured"
    t.datetime "matured_at"
    t.integer  "company_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "lead_source"
    t.string   "lead_status"
  end

  create_table "leads_products", :force => true do |t|
    t.integer  "lead_id"
    t.integer  "product_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "notification_settings", :force => true do |t|
    t.boolean  "notification_flag"
    t.integer  "user_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "notifications", :force => true do |t|
    t.boolean  "sms_sent"
    t.integer  "contact_id"
    t.string   "body"
    t.datetime "notification_time"
    t.integer  "company_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.boolean  "is_sms",            :default => false
    t.boolean  "is_email",          :default => false
    t.string   "subject"
  end

  add_index "notifications", ["company_id"], :name => "index_notifications_on_company_id"
  add_index "notifications", ["contact_id"], :name => "index_notifications_on_contact_id"

  create_table "product_transactions", :force => true do |t|
    t.integer  "product_id"
    t.integer  "transaction_id"
    t.float    "price"
    t.integer  "quantity"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "lead_id"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.float    "min_cost"
    t.float    "max_cost"
    t.string   "description"
    t.integer  "company_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "sales_executives", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "team_leader_id"
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "special_occasions", :force => true do |t|
    t.string   "title"
    t.string   "body"
    t.date     "occasion_date"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "contact_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "taggings", ["contact_id"], :name => "index_taggings_on_contact_id"
  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "targets", :force => true do |t|
    t.integer  "targetable_id"
    t.string   "targetable_type"
    t.integer  "amount"
    t.integer  "achived"
    t.integer  "company_id"
    t.integer  "target_month"
    t.integer  "target_year"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "team_leaders", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "transaction_field_values", :force => true do |t|
    t.integer  "transaction_id"
    t.integer  "transaction_field_id"
    t.string   "transaction_field_value"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "transaction_fields", :force => true do |t|
    t.string   "field_name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "transactions", :force => true do |t|
    t.float    "amount"
    t.datetime "transaction_time"
    t.integer  "company_id"
    t.integer  "contact_type"
    t.integer  "contact_id"
    t.integer  "matured_by"
    t.string   "executive_type"
    t.string   "transaction_type"
    t.string   "micr_code"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "account_id"
  end

  add_index "transactions", ["company_id"], :name => "index_transactions_on_company_id"
  add_index "transactions", ["contact_id", "contact_type"], :name => "index_transactions_on_contact_id_and_contact_type"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.integer  "mobile_no",              :limit => 8
    t.integer  "account_type"
    t.integer  "company_id"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",                  :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["company_id"], :name => "index_users_on_company_id"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
