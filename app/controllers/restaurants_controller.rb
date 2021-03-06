class RestaurantsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search, :top]
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

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
    @comment = Comment.new
    @comments = @restaurant.comments.includes(:user).order('created_at DESC')
    @like = Like.new
  end

  def edit
    render :show unless current_user == @restaurant.user || current_user.admin?
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

  def search
    @restaurants = Restaurant.search(params[:keyword])
  end

  def ranking
    @restaurants = Restaurant.all.sort { |a, b| b.liked_users.count <=> a.liked_users.count }
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :genre_id, :ambiance_id, :price_id, :tel, :address, :opening_hour,
                                       :closed, :image, :webpage, :parking, :others, :taste_rate, :price_rate, :service_rate)
          .merge(user_id: current_user.id)
  end
end
