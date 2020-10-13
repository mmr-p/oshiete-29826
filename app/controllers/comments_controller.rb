class CommentsController < ApplicationController
  before_action :set_item

  def create
    @comment = Comment.new(comment_params)
    @comments = @restaurant.comments.includes(:user).order('created_at DESC')

    if @comment.valid?
      @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment, name: @comment.user.name,
                                                      time: @comment.created_at.strftime('%Y/%m/%d %H:%M:%S')
    else
      ActionCable.server.broadcast 'comment_channel', error: 'undefined'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to restaurant_path(@restaurant.id)
    else
      flash.now[:alert] = 'コメントの削除に失敗しました'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :image).merge(user_id: current_user.id, restaurant_id: params[:restaurant_id])
  end

  def set_item
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
