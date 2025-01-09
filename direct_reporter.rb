require_relative 'receipt_dissector'
require_relative 'vision_api_service'
require_relative 'twilio_service'
require_relative 'aws_s3_service'

class DirectReporter
  def text_balance_to_person!(phone_number, object_key)
    message = create_message
    twilio = TwilioService.new
    twilio.send_message!("+18025950053", message)
  end

  def create_message
    vision = VisionApiService.new(ENV["TEST_OBJECT_KEY"])
    dissector = ReceiptDissector.new(vision.make_text_detection_http_call!)
  
    "I think that the total amount on this receipt is #{dissector.identify_total}. If that's not correct, take it up with Dyson."
  end
end