class MessagesController < ApplicationController

  def create

    @user = User.find(session[:user_id])
    @contact = Contact.find(params[:contact_id])
    @message = @contact.messages.new(messages_params)
    @message.to = '15759158643'
    @message.from = '14805682488'



    
    if @message.save
      flash[:notice] = 'message was successfully created'
      redirect_to @message
    else
      binding.pry
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
    params.require(:message).permit(:body)
  end

end
