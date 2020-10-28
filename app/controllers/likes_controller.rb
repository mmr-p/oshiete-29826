class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_restaurant

  def create
    @like = Like.new(user_id: current_user.id, restaurant_id: params[:restaurant_id])
    flash.now[:alert] = 'いいねに失敗しました' unless @like.save
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, restaurant_id: params[:restaurant_id])
    flash.now[:alert] = 'いいねの削除に失敗しました' unless @like.destroy
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
