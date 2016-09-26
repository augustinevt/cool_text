class Message < ApplicationRecord
  before_create :send_message

  private

  def send_message
    response = RestClient::Request.new(
      method: :post,
      url: 'https://api.twilio.com/2010-04-01/Accounts/AC04efbe0936700c21314bcd29d23d65d8/Messages.json',
      user: 'AC04efbe0936700c21314bcd29d23d65d8',
      password: 'd95621b53c4db186855751bb2d9de414',
      payload: {Body: self.body, To: self.to, From: self.from}
    ).execute
  end
end
