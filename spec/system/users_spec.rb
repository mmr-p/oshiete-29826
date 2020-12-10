require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザーの新規登録ができるとき' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに遷移
      visit root_path
      # 新規登録ボタンが存在することを確認
      expect (page).to have_content ('新規登録')
      # 新規登録ページへ遷移
      visit new_user_registration_path
      # ユーザー情報の入力
      fill_in 'Name' , with: @user.name
      fill_in 'Name_kana', with: @user.name_kana
      fill_in 'Employee_id', with: @user.employee_id
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      fill_in 'Password confirmation', with: @user.password_confirmation
      # 登録するとユーザーモデルのカウントが１上がることを確認
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      # トップページへ遷移したことを確認
      expect(current_path).to eq root_path
      # ログアウトボタンが存在することを確認
      expect (page).to have_content ('ログアウト')
      # 新規登録ボタンやログインボタンがないことを確認
      expect (page).to have_no_content ('新規登録')
      expect (page).to have_no_content ('ログイン')
    end
  end

  context 'ユーザーの新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに'
  end
end
