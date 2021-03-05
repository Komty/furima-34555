FactoryBot.define do
  factory :card_address do
    post_code { '123-4567' }
    prefecture_id{ 1 }
    city { '東京都' }
    address { '青山1-1' }
    building_name { '' }
    phone_number { 1111122222 }
  end
end
