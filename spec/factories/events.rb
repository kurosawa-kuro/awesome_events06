FactoryBot.define do
    factory :event do
      association :owner, factory: :user
      name { "Sample Event" }
      place { "Tokyo" }
      start_at { 1.day.from_now }
      end_at { 2.days.from_now }
      content { "This is a sample event." }
    end
  end