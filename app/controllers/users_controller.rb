class UsersController < ApplicationController
  before_action :authenticate_user!, except: :test_user
  before_action :set_user

  def show
    @restaurants = current_user.restaurants.order('created_at DESC')
  end

  def edit
  end

  def update
    flash.now[:alert] = '更新に失敗しました' unless @user.update(user_params)
  end

  def test_user
    user = User.find_or_create_by!(email: 'test@example.com') do |user|
      user.name = "テストユーザー"
      user.name_kana = "テストユーザー"
      user.employee_id = "111"
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:image)
  end
end
