require 'rails_helper'

RSpec.describe "Comments", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @restaurant = FactoryBot.build(:restaurant)
    @comment = FactoryBot.build(:comment)
  end
  context 'コメントができる時' do
    it 'ログインしたユーザーはコメントできる' do
      visit new_user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      visit new_restaurant_path
      image_path = Rails.root.join('app/assets/images/toppage.jpg')
      attach_file('restaurant_image', image_path)
      fill_in 'restaurant_name', with: @restaurant.name
      find('#taste_star').find("img[alt='1']").click
      find('#price_star').find("img[alt='1']").click
      find('#service_star').find("img[alt='1']").click
      find('#item-genre').find("option[value='2']").select_option
      find("#item-ambiance").find("option[value='2']").select_option
      find("#item-price").find("option[value='2']").select_option
      fill_in 'restaurant_description', with: @restaurant.description
      fill_in 'restaurant_tel', with: @restaurant.tel
      fill_in 'restaurant_address', with: @restaurant.address
      fill_in 'restaurant_opening_hour', with: @restaurant.opening_hour
      fill_in 'restaurant_closed', with: @restaurant.closed
      find('input[name="commit"]').click
      # 詳細ページに遷移
      find('.restaurant-img').click
      # コメント入力フォームがあることを確認
      expect(page).to have_content('コメントを投稿する')
      # コメントを投稿する
      fill_in 'comment[content]', with: @comment.content
      find('input[name="commit"]').click
      # リロードするとコメントモデルが１上がる（非同期通信のためリロード要）
      expect{
        visit current_path
      }.to change { Comment.count }.by(1)
      # ページにコメントした内容が存在することを確認
      expect(page).to have_content(@comment.content)
    end
  end
  context 'コメントができない時' do
    it 'ログインしていないとコメント入力フォームが存在しない' do
      visit new_user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      visit new_restaurant_path
      image_path = Rails.root.join('app/assets/images/toppage.jpg')
      attach_file('restaurant_image', image_path)
      fill_in 'restaurant_name', with: @restaurant.name
      find('#taste_star').find("img[alt='1']").click
      find('#price_star').find("img[alt='1']").click
      find('#service_star').find("img[alt='1']").click
      find('#item-genre').find("option[value='2']").select_option
      find("#item-ambiance").find("option[value='2']").select_option
      find("#item-price").find("option[value='2']").select_option
      fill_in 'restaurant_description', with: @restaurant.description
      fill_in 'restaurant_tel', with: @restaurant.tel
      fill_in 'restaurant_address', with: @restaurant.address
      fill_in 'restaurant_opening_hour', with: @restaurant.opening_hour
      fill_in 'restaurant_closed', with: @restaurant.closed
      find('input[name="commit"]').click
      # ログアウトする
      find('.login-btn').click
      # 詳細ページへ遷移
      visit restaurants_path
      find('.restaurant-img').click
      # コメントにはログインが必要な旨が表示されていることを確認する
      expect(page).to have_content('コメントの投稿には新規登録/ログインが必要です')
    end
  end
end
