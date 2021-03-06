class CardAddress  
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :card_id, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    # 数字3桁、ハイフン、数字4桁の並びのみ許可する
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
     # 0以外の整数を許可する
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    
    validates :city
    validates :address
    
    # ハイフンなし11桁半角数字のみ許可する
    validates :phone_number, numericality: {with: /\A\d{11}\z/, message: "半角数字を使用してください" } 
    validates :phone_number, length: {maximum: 11}
  end
  
    def save
      # 購入情報を保存し、変数cardに代入する
      card = Card.create(user_id: user_id, item_id: item_id)
      # 住所を保存する
      # card_idには、変数cardのidと指定する
      Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, card_id: card.id)
    end  

end