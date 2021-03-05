class Address < ApplicationRecord
  # # 数字3桁、ハイフン、数字4桁の並びのみ許可する
  # validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  # # 0以外の整数を許可する
  # validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  # # 全角文字のみ許可する
  # validates :city, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
  # # ハイフンなし10桁半角数字のみ許可する
  # validates :phone_number, numericality: {with: /\A\d{10}\z/}, message: "半角数字を使用してください" } do

  belongs_to :card
end
