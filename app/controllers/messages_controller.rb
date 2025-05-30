class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path # root_pathは予約後
    else
      @messages = Message.all
      render :index
    end
  end
  private
  def message_params
    params.require(:message).permit(:name, :content) #「:message」でpostされた要素のname即成「message」を拾う
  end
end
