FactoryGirl.define  do
  
  factory :user do
    sequence(:email) {|x| "some_email#{x}@gmail.com"}
    password "somevalidpassword123"
  end
end