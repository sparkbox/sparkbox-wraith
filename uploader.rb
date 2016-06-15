require "s3_uploader"

class Uploader

  def self.upload(s3_key, s3_secret)
    bucket_name = "sparkbox-wraith"
    wraith_folder = "./wraith/shots/"
    timestamp = Time.now.to_i
    remote_folder = "wraith-#{timestamp}/"

    uploader = S3Uploader::Uploader.new({
      :s3_key => s3_key,
      :s3_secret => s3_secret,
      :destination_dir => remote_folder,
      :region => 'us-west-1',
      :threads => 10
    })

    puts "Uploading to #{wraith_folder + remote_folder}"
    uploader.upload(wraith_folder, bucket_name)
  end
end
