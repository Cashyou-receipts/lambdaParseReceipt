require 'twilio-ruby'

class TwilioService
  @client = Twilio::REST::Client.new(account_sid, auth_token)

  account_sid = ENV["TWILIO_ACCOUNT_SID"]
  auth_token = ENV["TWILIO_AUTH_TOKEN"]
  
  from = ENV["TWILIO_PHONE_NUMBER"]

  def send_message!(phone_number, message)
    @client.messages.create(
      from: from,
      to: phone_number,
      body: message
    )
  end
end