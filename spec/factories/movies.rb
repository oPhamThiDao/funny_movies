FactoryBot.define do
  factory :movie do
    sequence(:url) { |n| "https://youtu.be/xxxxx#{n}" }
    title { "title" }
    description { "content" }
    likes_count { 0 }
    dislikes_count { 0 }
    association :user
  end
end
