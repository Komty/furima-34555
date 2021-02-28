FactoryBot.define do
  factory :item do
    association :user
    
    name {"田中"}
    description {"田中"}
    category_id {1}
    status_id {1}
    delivery_cost_id {1}
    prefecture_id {1}
    delivery_day_id {1}
    price {300}
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end