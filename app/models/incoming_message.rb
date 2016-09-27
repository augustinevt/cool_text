class IncomingMessage

  def initialize (body, to, from, media)
   @body = body
   @to = to
   @from = from
   @media = media
  end

  attr_accessor :body, :to, :from


  def respond_with(body)
    payload = {Body: body[0], To: @from, From: @to}
    payload[:MediaUrl] = body[1] if body[1]
    begin
     response = RestClient::Request.new(
     method: :post,
     url: "https://api.twilio.com/2010-04-01/Accounts/#{ENV['TWILIO_ACCOUNT_SID']}/Messages.json",
     user: ENV['TWILIO_ACCOUNT_SID'],
     password: ENV['TWILIO_AUTH_TOKEN'],
     payload: payload
     ).execute
   rescue

      throw(:abort)
    end
  end



  def scrape_news
    require 'open-uri'
    doc = Nokogiri::HTML(open('http://www.nytimes.com/'))
    headlines = doc.css('article')
    headlinesArray = []
    headlines.each do |headline|
      title = headline.css('h2').text
      summary = headline.css('.summary').text
      #link = headline.css('a')[0]['href'] ? headline.css('a')[0]['href'] :
      link = "foo"
      headlinesArray << Headline.new(title, summary, link)
    end
    return headlinesArray[0..4]
  end

  def scrape_space
    require 'open-uri'
    require 'uri'
    doc = Nokogiri::HTML(open('http://www.astronomy.com/photos/picture-of-day'))
    image_path = URI.encode('http://www.astronomy.com' + doc.css('.hero').css('img')[0]['src'])
    [nil, image_path]
  end

  def print_headlines(headlinesArray)
    full_message = "Here is the news today: \n\n\n"
    headlinesArray.each do |headline|
      full_message += headline.title + "\n\n" + headline.summary + "\n\n"
    end
    return [full_message, nil]
  end


end
