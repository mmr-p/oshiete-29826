class RestaurantsController < ApplicationController
  before_action :move_to_login
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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
      redirect_to restaurants_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    render :show unless current_user == @restaurant.user
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path
    else
      render :edit
    end
  end

  def destroy
    if @restaurant.destroy
      redirect_to restaurants_path
    else
      render :show
    end
  end

  private

  def set_item
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :genre_id, :ambiance_id,
                                       :price_id, :tel, :address, :opening_hour, :closed, :image).merge(user_id: current_user.id)
  end

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end
end
