load_paths = Dir["./vendor/bundle/ruby/3.2.0/gems/**/lib"]
$LOAD_PATH.unshift(*load_paths)
$VERBOSE = nil
require_relative 'direct_reporter'
require 'uri'

def lambda_handler(event:, context:)
  object_key = URI.decode_www_form_component(event["Records"].first["s3"]["object"]["key"])
  metadata = AwsS3Service::CLIENT.head_object(bucket: ENV["S3_BUCKET_NAME"], key: object_key).metadata
  phone_number = metadata["from_number"]
  reporter = DirectReporter.new
  success = reporter.text_balance_to_person!(phone_number, object_key)
  puts "TWILIO RESPONSE: #{success}"
  ## TODO
  # replace this placeholder response with useful response codes.
  return {
      statusCode: 200,
      body: {
        message: 'placeholder response'
      }.to_json
    }
end