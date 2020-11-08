class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show
    @restaurants = current_user.restaurants.order('created_at DESC')
  end

  def edit
  end

  def update
    flash.now[:alert] = '更新に失敗しました' unless @user.update(user_params)
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:image)
  end
end
