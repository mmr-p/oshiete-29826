require 'rails_helper'

RSpec.describe '飲食店情報投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @restaurant = FactoryBot.build(:restaurant)
  end
  context '飲食店情報を投稿できるとき'do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 飲食店情報一覧ページへ遷移
      visit restaurants_path
      # 新規投稿ページへのリンクがあることを確認する
      expect(page).to have_content('投稿する')
      # 投稿ページに移動する
      visit new_restaurant_path
      # フォームに情報を入力する
      image_path = Rails.root.join('app/assets/images/toppage.jpg')
      attach_file('restaurant_image', image_path)
      fill_in 'restaurant_name', with: @restaurant.name
      find('#item-genre').find("option[value='2']").select_option
      find("#item-ambiance").find("option[value='2']").select_option
      find("#item-price").find("option[value='2']").select_option
      fill_in 'restaurant_description', with: @restaurant.description
      fill_in 'restaurant_tel', with: @restaurant.tel
      fill_in 'restaurant_address', with: @restaurant.address
      fill_in 'restaurant_opening_hour', with: @restaurant.opening_hour
      fill_in 'restaurant_closed', with: @restaurant.closed
      # 送信するとレストランモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Restaurant.count }.by(1)
      # 一覧ページに遷移することを確認する
      expect(current_path).to eq restaurants_path
      # 先ほど投稿した情報が存在することを確認する
      expect(page).to have_content(@restaurant.name)
    end
  end
  context '飲食店情報を投稿できないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # 新規投稿ページに遷移しようとするとログインページに遷移する
      visit new_restaurant_path
      expect(current_path).to eq new_user_session_path
    end
  end
end