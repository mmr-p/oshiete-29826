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
      expect(page).to have_content('新規登録')
      # 新規登録ページへ遷移
      visit new_user_registration_path
      # ユーザー情報の入力
      fill_in 'user_name' , with: @user.name
      fill_in 'user_name_kana', with: @user.name_kana
      fill_in 'user_employee_id', with: @user.employee_id
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      fill_in 'user_password_confirmation', with: @user.password_confirmation
      # 登録するとユーザーモデルのカウントが１上がることを確認
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      # トップページへ遷移したことを確認
      expect(current_path).to eq root_path
      # ログアウトボタンが存在することを確認
      expect(page).to have_content('ログアウト')
      # 新規登録ボタンやログインボタンがないことを確認
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end

  context 'ユーザーの新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに' do
      # トップページに遷移
      visit root_path
      # 新規登録ボタンが存在することを確認
      expect(page).to have_content('新規登録')
      # 新規登録ページへ遷移
      visit new_user_registration_path
      # ユーザー情報の入力
      fill_in 'user_name' , with: ""
      fill_in 'user_name_kana', with: ""
      fill_in 'user_employee_id', with: ""
      fill_in 'user_email', with: ""
      fill_in 'user_password', with: ""
      fill_in 'user_password_confirmation', with: ""
      # 登録ボタンを押してもユーザーモデルのカウントは増えないことを確認
      expect{
        find('input[name="commit"]').click
    }.to change { User.count }.by(0)
      # 新規登録ページへ戻されることを確認
      expect(current_path).to eq "/users"
    end
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインできるとき' do
    it '保存されているユーザーの情報と合致すればログインできる' do
      # トップページに遷移
      visit root_path
      # ログインボタンがあることを確認
      expect(page).to have_content('ログイン')
      # ログインページへ遷移
      visit new_user_session_path
      # 正しいユーザー情報を入力
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # トップページへ遷移することを確認
      expect(current_path).to eq root_path
      # ログアウトボタンが存在することを確認
      expect(page).to have_content('ログアウト')
      # 新規登録ボタンやログインボタンがないことを確認
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end
  context 'ログインできないとき' do
    it '保存されているユーザーの情報と合致しないとログインできない' do
      # トップページに遷移
      visit root_path
      # ログインボタンがあることを確認
      expect(page).to have_content('ログイン')
      # ログインページへ遷移
      visit new_user_session_path
      # ユーザー情報を入力
      fill_in 'user_email', with: ""
      fill_in 'user_password', with: ""
      # ログインボタンを押す
      find('input[name="commit"]').click
      # ログインページへ戻されることを確認
      expect(current_path).to eq new_user_session_path
    end
  end
end