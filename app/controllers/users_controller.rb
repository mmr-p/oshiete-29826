class UsersController < ApplicationController
  before_action :move_to_login
  before_action :set_user
  def show
    @restaurants = current_user.restaurants
  end

  def edit
  end

  def update
    flash.now[:alert] = '更新に失敗しました' unless @user.update(user_params)
  end

  private

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:image)
  end
end
