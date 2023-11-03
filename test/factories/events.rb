FactoryBot.define do
  factory :event do
    owner_id { "" }
    name { "MyString" }
    place { "MyString" }
    start_at { "2023-11-03 07:53:23" }
    end_at { "2023-11-03 07:53:23" }
    content { "MyText" }
  end
end
