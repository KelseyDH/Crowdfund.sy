# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    user nil
    reward_level nil
    stripe_txn_id "MyString"
  end
end
