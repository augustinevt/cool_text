class MessagesController < ApplicationController

  def create
    all_saved = true
    @user = User.find(session[:user_id])
    if params[:contacts]
      params[:contacts].each do |contact|
      @contact = Contact.find(contact)
        @message = @contact.messages.new(messages_params)
        @message.to = @contact.phone
        @message.from = @user.number
        if @message.save
          flash[:notice] = "message was successfully sent to " + "#{@contact.name} "
          all_saved = true
        else
          flash[:alert] = 'some contacts could not be reached'
          all_saved = false
          break
        end
      end
    else
      @contact = Contact.find(params[:contact_id])
      @message = @contact.messages.new(messages_params)
      @message.to = @contact.phone
      @message.from = @user.number
      if @message.save
        flash[:notice] = "message was successfully sent to " + "#{@contact.name} "
        all_saved = true
      else
        flash[:alert] = 'some contacts could not be reached'
        all_saved = false
      end
      if all_saved
        redirect_to root_path
      else
        render 'new'
      end
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
