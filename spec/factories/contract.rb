FactoryGirl.define do
  factory :contract do
    rate 100
    wedding_date Date.tomorrow
    photographer_id 1
  end
end
