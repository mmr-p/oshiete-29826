class MessagesController < ApplicationController
  def index
    @messages = Message.includes(:user).order(:id)
    @message = current_user.messages.new
  end

  def create
    @message = Message.new(message_params)
    if @message.valid?
      @message.save
      ActionCable.server.broadcast 'message_channel', message: @message.template
    else
      
    end
      
  end

  private
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
