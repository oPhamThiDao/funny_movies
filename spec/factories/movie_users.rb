FactoryBot.define do
  factory :movie_user do
    status { "like" }
    association :movie
    association :user
  end
end
