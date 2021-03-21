FactoryBot.define do
  factory :comment do
    association :item
    association :user

    text {"こんにちは"}
  end
end
