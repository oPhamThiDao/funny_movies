FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    password { "passwordexample" }
  end
end
