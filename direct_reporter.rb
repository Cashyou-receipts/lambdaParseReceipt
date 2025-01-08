require 'receipt_dissector'
require 'vision_api_service'
require 'twilio_service'
require 'aws_s3_service'

class DirectReporter
  def initialize(image_url)
    @image_url = image_url
  end
  
  vision = VisionApiService.new
  twilio = TwilioService.new

  vision.
end