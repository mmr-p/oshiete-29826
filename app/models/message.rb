class Message < ApplicationRecord
  belongs_to :user

  validates :content, presence: true

  def template
    ApplicationController.renderer.render partial: 'shared/message', locals: { message: self }
  end
end
