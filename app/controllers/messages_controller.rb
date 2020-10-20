class MessagesController < ApplicationController
  before_action :set_item

  def index
    @message = current_user.messages.new
  end

  def create
    @message = Message.new(message_params)
    if @message.valid?
      @message.save
      ActionCable.server.broadcast 'message_channel', content: @message, name: @message.user.name,
                                                      time: @message.created_at.strftime('%Y/%m/%d %H:%M:%S')
    else
      ActionCable.server.broadcast 'message_channel', error: 'error'
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end

  def set_item
    @messages = Message.includes(:user).order('created_at ASC')
  end
end
