FactoryGirl.define do
  factory :lead do
    title 'Prakash chemicals pvt ltd'
    description 'Chemical factory'
    matured false
    user_id 2
    matured_at nil
    company_id 1
    lead_source 'cold_call'
    lead_status 'Lead'
    opening_date Date.today+10.days
  end
end
