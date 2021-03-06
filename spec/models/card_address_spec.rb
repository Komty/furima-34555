require 'rails_helper'

RSpec.describe CardAddress, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @card_address = FactoryBot.build(:card_address, user_id: user.id, item_id: item.id)
      sleep 1
    end

    context '購入できるとき' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@card_address).to be_valid
      end

      it 'building_nameは空でも登録できること' do
        @card_address.building_name = ''
        expect(@card_address).to be_valid
      end
    end
    
    context '購入できないとき' do
      it 'post_codeが空だと登録できないこと' do
        @card_address.post_code = ''
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include("Post code can't be blank")
      end
      
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと登録できないこと' do
        @card_address.post_code = '1234567'
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
    
      it 'prefecture_idを選択していないと登録できないこと' do
        @card_address.prefecture_id = 0
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      
      it 'cityが空だと登録できないこと' do
        @card_address.city = ''
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空だと登録できないこと' do
        @card_address.address = ''
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include("Address can't be blank")
      end
      
      it 'phone_numberが空だと登録できないこと' do
        @card_address.phone_number = ''
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include("Phone number 半角数字を使用してください")
      end

      it 'phone_numberが半角数字でなければ登録できないこと' do
        @card_address.phone_number = '１１１１１１１１１１' # 意図的に全角数字の入力を行いエラーを発生させる
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include("Phone number 半角数字を使用してください")
      end

      it 'phone_numberが半角数字が１１桁以下でなければ登録できないこと' do
        @card_address.phone_number = '123456789012' # 意図的に１２桁の入力を行いエラーを発生させる
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end

      it 'phone_numberが英数混合では登録できないこと' do
        @card_address.phone_number = '11111aaaaa'
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include("Phone number 半角数字を使用してください")
      end

      it 'tokenが空だと購入できないこと' do
        @card_address.token = ''
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空だと購入できないこと' do
        @card_address.user_id = ''
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと購入できないこと' do
        @card_address.item_id = ''
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include("Item can't be blank")
      end
    end
    
  end
end
