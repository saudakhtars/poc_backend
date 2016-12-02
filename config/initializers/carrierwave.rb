CarrierWave.configure do |config|

  default_key = '3dyD5OD'
  default_secret = '3dyD5OD'
  default_bucket = 'development'

  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'] || default_key,
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'] || default_secret,
    region:                'us-west-1'
  }

  # For testing, upload files to local `tmp` folder.
  if Rails.env.test? || Rails.env.cucumber?
    config.storage           = :file
    config.enable_processing = false
    config.root              = "#{Rails.root}/tmp"
  else
    config.storage = :fog
  end

  config.cache_dir        = "#{Rails.root}/tmp/uploads" # To let CarrierWave work on Heroku
  config.fog_directory    = ENV['AWS_S3_BUCKET'] || default_bucket
end


