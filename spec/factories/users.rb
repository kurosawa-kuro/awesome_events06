FactoryBot.define do
    factory :user do
      provider { "github" }
      sequence(:uid) { |n| "uid#{n}" }
      name { "John Doe" }
      image_url { "https://example.com/john.jpg" }
  
      # これは関連するイベントを作成するときに使えるトレイトです
      trait :with_events do
        after(:create) do |user|
          create_list(:event, 3, owner: user)
        end
      end
    end
  end