class Card < ApplicationRecord
  # validates :user_id, presence: true
  # validates :item_id, presence: true

  belongs_to :user
  has_one :addresse
  belongs_to :item
end
