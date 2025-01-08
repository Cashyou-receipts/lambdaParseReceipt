require "aws-sdk-s3"

class AwsS3Service
  CLIENT = Aws::S3::Client.new(
    access_key_id: ENV['S3_ACCESS_KEY'],
    secret_access_key: ENV['S3_SECRET_ACCESS_KEY'],
    force_path_style: true, 
    region: ENV['S3_BUCKET_REGION']
  )

  def list_buckets
    resp = CLIENT.list_buckets
    resp.buckets.map(&:name)
  end

  def list_objects(bucket:)
    CLIENT.list_objects_v2(bucket: bucket).contents
  end

  def upload_receipt!(filename:, object_key:)
    File.open(filename, "rb") do |file|
      CLIENT.put_object({
        body: file,
        bucket: ENV["S3_BUCKET_NAME"],
        key: object_key,
        metadata: {
          "updload_date"=>Date.today.to_s
        },
        content_type: "image/jpg"
      })
    end
  end

  def delete_receipt(keys:)
    keys = Array(keys)
    resp = CLIENT.delete_objects({
      bucket: ENV["S3_BUCKET_NAME"],
      delete: {
        objects: keys.map{ |key| {key: key}},
        quiet: false
      },
    })
    resp
  end

  def generate_presigned_url(bucket_name: ENV["S3_BUCKET_NAME"], object_key:, expires_in: 3600)
    signer = Aws::S3::Presigner.new(client: CLIENT)

    signer.presigned_url(
      :get_object,
      bucket: bucket_name,
      key: object_key,
      expires_in: expires_in
    )
  end
end