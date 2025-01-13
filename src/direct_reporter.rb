require_relative 'receipt_dissector'
require_relative 'vision_api_service'
require_relative 'twilio_service'
require_relative 'aws_s3_service'

class DirectReporter
  def text_balance_to_person!(phone_number, object_key)
    message = create_message(object_key)
    twilio = TwilioService.new
    success = twilio.send_message!(phone_number, message)
    success
  end

  def create_message(object_key)
    vision = VisionApiService.new(object_key)
    dissector = ReceiptDissector.new(vision.make_text_detection_http_call!)
  
    "I think that the total amount on this receipt is #{dissector.identify_total}. If that's not correct, take it up with Dyson."
  end

  def fetch_phone_number(object_key)
    s3 = AwsS3Service.new
    response = AwsS3Service::CLIENT.head_object(bucket: ENV["S3_BUCKET_NAME"], key: object_key)
    response.metadata["from_number"]
  end
end