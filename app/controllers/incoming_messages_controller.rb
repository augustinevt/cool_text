class IncomingMessagesController < ApplicationController
  protect_from_forgery except: :create
  def create
    status = 'init'
    im = IncomingMessage.new(params[:Body], params[:To], params[:From])

    if im.respond_with("I read no texts...")
      status = 'message sent'
    else
      status = 'message not sent'
    end
  end


end
