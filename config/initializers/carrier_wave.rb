# frozen_string_literal: true

CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['S3_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['S3_SECRET_ACCESS_KEY'],
    region: 'eu-north-1',
    signatureVersion: 'v4',
  }

  config.fog_directory = ENV['S3_BUCKET']
end
