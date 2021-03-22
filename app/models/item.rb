class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do       
    validates   :name
    validates   :description
    validates   :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 } 
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
  has_one :card
  has_one_attached :image
  has_many :comments, dependent: :destroy

  belongs_to :category
  belongs_to :delivery_cost
  belongs_to :delivery_day
  belongs_to :prefecture
  belongs_to :status

  def self.search(search)
    if search != ""
      Item.where('name LIKE(?)', "%#{search}%")
      Item.where('description LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
