class TeamLeader < ActiveRecord::Base
  attr_accessible :employee_id, :user_id

  has_many :leads, :as => :leadable
  belongs_to :user
  has_many :sales_executives



end
