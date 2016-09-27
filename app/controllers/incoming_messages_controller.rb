class IncomingMessagesController < ApplicationController
  protect_from_forgery except: :create

  def create
    status = 'init'
    im = IncomingMessage.new(params[:Body], params[:To], params[:From], params[:MediaUrl])

    if im.body === 'space'
      im.respond_with(im.scrape_space)
    elsif im.body === 'news'
      im.respond_with(im.print_headlines(im.scrape_news))
    else
      im.respond_with('Foo foo, you are...')
    end
  end


end
