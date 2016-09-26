class Message < ApplicationRecord
  before_create :send_message

  private

  def send_message
    response = []
    begin
      response = RestClient::Request.new(
      method: :post,
      url: 'https://api.twilio.com/2010-04-01/Accounts/AC04efbe0936700c21314bcd29d23d65d8/Messages.json',
      user: ENV['TWILIO_ACCOUNT_SID'],
      password: ENV['TWILIO_AUTH_TOKEN'],
      payload: {body: self.body, to: self.to, from: self.from}
    ).execute
    rescue
      return false
    end
  end
end
