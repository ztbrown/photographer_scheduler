FactoryGirl.define do
  factory :contract do
    rate 100
    wedding_date Date.today + 1
    photographer_id 1
  end
end
