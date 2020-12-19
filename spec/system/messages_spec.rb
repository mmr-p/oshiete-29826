require 'rails_helper'

RSpec.describe "Messages", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @message = FactoryBot.build(:message)
  end
  context 'チャットを送信できる時' do
    it 'ログインしたユーザーはチャットを送信できる' do
      # ログイン
      visit new_user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # チャットページへ遷移
      visit messages_path
      # チャットメッセージを送信する
      fill_in 'message[content]', with: @message.content
      find('#chat-send-btn').click
      # リロードするとメッセージモデルが１上がる（非同期通信のためリロード要）
      expect{
        visit current_path
      }.to change { Message.count }.by(1)
      # ページにコメントした内容が存在することを確認
      expect(page).to have_content(@message.content)
    end
  end
  context 'チャットを送信できない時' do
    it 'ログインしていないユーザーはチャットページに遷移しようとするとログインページへリダイレクトさせられる' do
      # チャットページへ遷移
      visit messages_path
      # ログインページへリダイレクトされている
      expect(current_path).to eq new_user_session_path
    end
  end
end
