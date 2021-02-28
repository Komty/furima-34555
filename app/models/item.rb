class Item < ApplicationRecord

  with_options presence: true do       
    validates   :name
    validates   :description
    validates   :price, numericality: { only_integer: true, length: { in: 300..9,999,999 }
    validates   :image
  end
  
  with_options presence: true, numericality: { other_than: 0, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :delivery_cost_id
    validates :prefecture_id
    validates :delivery_day_id
  end

  belongs_to :user
  has_one_attached :image
end
