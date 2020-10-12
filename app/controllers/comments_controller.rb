class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comments = @restaurant.comments.includes(:user).order('created_at DESC')

    if @comment.valid?
      @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment, name: @comment.user.name,
                                                      time: @comment.created_at.strftime('%Y/%m/%d %H:%M:%S')
    else
      ActionCable.server.broadcast 'comment_channel', error: 'undefined'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :image).merge(user_id: current_user.id, restaurant_id: params[:restaurant_id])
  end
end
