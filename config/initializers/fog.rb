
CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp')
  config.cache_dir = 'carrierwave'
  # Fog with carrierwave gem config
  config.fog_credentials = {
    provider:               'AWS',
    aws_access_key_id:      ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key:  ENV['AWS_SECRET_ACCESS_KEY'],
    region:                 ENV['AWS_REGION']

  }


  #For testing, upload files to local `tmp` folder.
  # if Rails.env.test? || Rails.env.cucumber?
  #   config.storage             = :file
  #   config.enable_processing   = false
  #   config.root                = "#{Rails.root}/tmp"
  # else
  #   config.storage = :fog
  # end

  config.cache_dir  = "#{Rails.root}/tmp/uploads" # For carrierwave to work on heroku
  #
  config.fog_directory  = ENV['S3_BUCKET']
  config.fog_public     = false
  # config.fog_use_ssl_for_aws = false
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end
# unless ENV['AWS_ACCESS_KEY_ID'].blank?
#
#
# end

# MiniMagick module to control img quality
module CarrierWave
  module MiniMagick
    def quality(percentage)
      manipulate! do |img|
        img.quality(percentage.to_s)
        img = yield(img) if block_given?
        img
      end
    end
  end
end
