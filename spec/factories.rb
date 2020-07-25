FactoryBot.define do

  factory :enrollment do
    association :user, factory: :user
    association :course, factory: :course
  end

  factory :user do
    email { "user#{rand(1..999)}@mail.com" }

    trait :with_courses do
      after(:create) do |user|
        create_list :enrollment, 2, user: user
      end
    end
  end

  factory :course do
    name { "Economics #{rand(1..999)}" }

    trait :with_users do
      after(:create) do |course|
        create_list :enrollment, 5, course: course
      end
    end
  end
end
