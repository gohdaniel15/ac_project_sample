FactoryGirl.define do
  factory :user do
    first_name 'john'
    last_name 'doe'
    sequence(:username) { |n| "user#{n}" }
    sequence(:email) { |n| "email#{n}@example.com" }
    password '123123123'
  end
end
