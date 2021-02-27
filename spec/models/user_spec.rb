require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    
      context '新規登録できるとき' do
        it '全ての項目の入力が存在すれば登録できること' do
          expect(@user).to be_valid
        end

        it 'passwordが英数字を含む6文字以上であれば登録できること' do
          @user.password = '123456a'
          @user.password_confirmation = '123456a'
          expect(@user).to be_valid
        end
      end

      context '新規登録できないとき' do
        it 'nicknameが空では登録できないこと' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it 'emailが空では登録できないこと' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it 'passwordが空では登録できないこと' do
          @user.password = ''
          @user.valid?
         expect(@user.errors.full_messages).to include("Password can't be blank")
        end
   
        it 'family_nameが空では登録できないこと' do
          @user.family_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name can't be blank")
        end

        it 'first_nameが空では登録できないこと' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it 'family_name_kanaが空では登録できないこと' do
          @user.family_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana can't be blank")
        end

        it 'first_name_kanaが空では登録できないこと' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end

        it 'birthdayが空では登録できないこと' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end

        it 'passwordが5文字以下であれば登録できないこと' do
          @user.password = '12345'
          @user.password_confirmation = '12345'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end

        it 'passwordが英数字を含む6文字以上でなければ登録できないこと' do
          @user.password = '123456' 
          @user.password_confirmation = '123456'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
        end

        it 'passwordとpassword_confirmationが不一致では登録できないこと' do
          @user.password = '123456'
          @user.password_confirmation = '1234567'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")  
        end

        it 'emailが＠を含まなければ登録できないこと' do
          @user.email = '111eee' # 意図的に@を含めないで入力を行いエラーを発生させる
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
  
        it '重複したemailが存在する場合登録できないこと' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')  
        end

        it 'family_nameが全角入力でなければ登録できないこと' do
          @user.family_name = "ｱｲｳｴｵ" # 意図的に半角入力を行いエラーを発生させる
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name 全角文字を使用してください")
        end
  
        it 'family_nameが全角入力でなければ登録できないこと' do
          @user.first_name = "ｱｲｳｴｵ" # 意図的に半角入力を行いエラーを発生させる
          @user.valid?
          expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
        end
  
        it 'family_name_kanaが全角カタカナでなければ登録できないこと' do
          @user.family_name_kana = "あいうえお" # 意図的にひらがな入力を行いエラーを発生させる
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana 全角カタカナを使用してください")
        end
  
        it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
          @user.first_name_kana = "あいうえお"  # 意図的にひらがな入力を行いエラーを発生させる
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana 全角カタカナを使用してください")
        end
      end
  end  
end
