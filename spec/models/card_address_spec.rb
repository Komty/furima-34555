require 'rails_helper'

RSpec.describe CardAddress, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      @card_address = FactoryBot.build(:card_address, user_id: user.id)
    end

    context '購入できるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@card_address).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @donation_address.building_name = ''
        expect(@donation_address).to be_valid
      end
    end
    
    context '購入できないとき' do
      it 'post_codeが空だと保存できないこと' do
        @card_address.post_code = ''
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include("Post code can't be blank")
      end
      
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @card_address.postal_code = '1234567'
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
    
      it 'prefecture_idを選択していないと保存できないこと' do
        @card_address.prefecture = 0
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include("Prefecture_id can't be blank")
      end
      
      it 'cityが空だと保存できないこと' do
        @card_address.city = ''
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空だと保存できないこと' do
        @card_address.address = ''
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include("Address can't be blank")
      end
      
      it 'phone_numberが空だと保存できないこと' do
        @card_address.phone_number = ''
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include("Phone_number can't be blank")
      end
    end
    
  end
end
