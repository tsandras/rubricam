if !Rails.env.development?
    CarrierWave.configure do |config|
      config.storage    = :aws
      config.aws_bucket = ENV.fetch('rubricam-avatars')
      config.aws_acl    = :public_read
      config.asset_host = 'http://s3-eu-west-1.amazonaws.com'
      config.aws_authenticated_url_expiration = 60 * 60 * 24 * 365

      config.aws_credentials = {
        access_key_id:     ENV.fetch('AWS_ACCESS_KEY_ID'),
        secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY')
      }
    end
end
