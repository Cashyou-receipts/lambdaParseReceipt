require 'twilio-ruby'

class TwilioService
  def initialize
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @from = ENV["TWILIO_PHONE_NUMBER"]
  end

  def send_message!(phone_number, message)
    success = @client.messages.create(
      from: @from,
      to: phone_number,
      body: message
    )
    success
  end
end