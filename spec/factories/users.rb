FactoryBot.define do
  factory :user do
    nickname {"たなか"}
    email {Faker::Internet.free_email}
    password {'a11111'}
    family_name {"田中"}
    first_name {"太郎"}
    family_name_kana {"タナカ"}
    first_name_kana {"タロウ"}
    birthday {Faker::Date.between(from: 2.days.ago, to: Date.today)}             
  end
end