CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['S3_KEY'],
    aws_secret_access_key: ENV['S3_ACCESS_KEY'],
    region: "ap-northeast-1",
    path_style: true,
  }
  config.fog_directory = ENV['BUCKET_NAME']
  config.storage :fog
  # config.asset_host = ENV['S3_ASSET_HOST']
end
