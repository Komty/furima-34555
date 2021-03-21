require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#create' do
    before do
      @comment = FactoryBot.build(:comment)
    end

    context 'コメント投稿ができるとき' do
      it '全ての項目の入力が存在すれば投稿できること' do
        expect(@comment).to be_valid
      end
    end

    context 'コメント投稿ができないとき' do
      it 'テキストがないと投稿できない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
    
      it 'ユーザーが紐づいてないと投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end
    end
  
  end  
end