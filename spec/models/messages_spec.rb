require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'コメント投稿機能' do
    before do
      @message = FactoryBot.build(:message)
    end

    it 'チャットテキストが入力されていれば投稿できる' do
      expect(@message).to be_valid
    end

    it 'チャットテキストが入力されていないと投稿できない' do
      @message.content = nil
      @message.valid?
      expect(@message.errors.full_messages).to include('テキストを入力してください')
    end

    it 'userが紐づいていないと保存できない' do
      @message.user = nil
      @message.valid?
      expect(@message.errors.full_messages).to include('ユーザーを入力してください')
    end
  end
end
