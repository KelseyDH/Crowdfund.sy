# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reward_level do
    title "MyString"
    details "MyText"
    amount 1
    campaign nil
  end
end
