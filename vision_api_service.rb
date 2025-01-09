require_relative "environment"
require "faraday"
require "google-cloud-vision"

class VisionApiService
  # TODO when deployed, configure app to utilize json for authentication
  # TEXT_CLIENT = Google::Cloud::Vision.image_annotator
  API_KEY = ENV["VISION_API_KEY"]

  REGION_ID = ENV["COMPUTE_REGION"]
  ZONE_ID = ENV["COMPUTE_ZONE"]
  PROJECT_ID = ENV["GOOGLE_PROJECT_ID"]
  
  def initialize(object_key)
    @object_key = object_key
  end

  def make_text_detection_http_call!
    vision_url = "https://vision.googleapis.com"
    conn = create_connection(vision_url)
    image_url = build_aws_url
    body = build_text_detection_request_body(image_url)
    endpoint = "/v1/images:annotate?key=#{API_KEY}"
    response = conn.post(endpoint, body)
    response.body.is_a?(Hash) ? response.body : JSON.parse(response.body)
  end
  
  private
    
    def build_aws_url
      AwsS3Service.new.generate_presigned_url(object_key: @object_key)
    end

    def build_text_detection_request_body(image_url)
      {
        "requests": [
          {
            "image": {
              "source": {
                "imageUri": image_url
              }
            },
            "features": [
              {
                "type": "DOCUMENT_TEXT_DETECTION"
              }
            ]
          }
        ]
      }.to_json
    end

    def create_connection(url)
      Faraday.new(
        url: url,
        params: {key: API_KEY}
      ) do |f|
        f.request :json
        f.response :json
        f.adapter Faraday.default_adapter
      end
    end
end
