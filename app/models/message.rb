class Message < ActiveRecord::Base
  before_create :send_message

  private

  def send_message
    begin
      response = RestClient::Request.new(
      method: :post,
      url: 'https://api.twilio.com/2010-04-01/Accounts/AC04efbe0936700c21314bcd29d23d65d8/Messages.json',
      user: ENV['TWILIO_ACCOUNT_SID'],
      password: ENV['TWILIO_AUTH_TOKEN'],
      payload: {Body: 'foo', To: '15759158643', From: '14805682488'}
    ).execute
  rescue Exception => error
      binding.pry
      throw(:abort)
    end
  end
end
