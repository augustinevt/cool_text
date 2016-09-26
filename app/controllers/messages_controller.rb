class MessagesController < ApplicationController

  def create
    @message = Message.new(messages_params)
    if @message.save
      flash[:notice] = 'message was successfully created'
      redirect_to @message
    else
      flash[:alert] = 'message was not created'
      render :new
    end
  end

  def new
    @message = Message.new
  end

  def show
    @message = Message.find(params[:id])
  end

  private

  def messages_params
    params.require(:message).permit(:body, :to, :from)
  end

end
