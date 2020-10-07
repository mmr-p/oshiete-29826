class RestaurantsController < ApplicationController
  before_action :move_to_login

  def top
  end

  def index
    @restaurants = Restaurant.order('created_at DESC')
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.valid?
      @restaurant.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :genre_id, :ambiance_id,
                                       :price_id, :tel, :address, :opening_hour, :closed, :image).merge(user_id: current_user.id)
  end

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end
end
