FactoryGirl.define do
  factory :job_listing do
    association :user, factory: :user
    position 'position'
    description 'description'
    salary 1000

    trait :invalid do
      position nil
    end
  end
end
