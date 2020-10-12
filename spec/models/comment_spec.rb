require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'コメント投稿機能' do
    before do
      @comment = FactoryBot.build(:comment)
    end

    it 'コメントが入力されていれば投稿できる' do
      expect(@comment).to be_valid
    end

    it 'コメントが入力されていないと投稿できない' do
      @comment.content = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include('コメントを入力してください')
    end

    it 'userが紐づいていないと保存できない' do
      @comment.user = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include('ユーザーを入力してください')
    end

    it 'restaurantが紐づいていないと保存できない' do
      @comment.restaurant = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include('店舗情報を入力してください')
    end
  end
end
