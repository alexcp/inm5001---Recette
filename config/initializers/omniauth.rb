Rails.application.config.middleware.use OmniAuth::Builder do
  require 'openid/store/filesystem' 
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  provider :twitter, "CONSUMER_KEY", "CONSUMER_SECRET"
  provider :openid, :store => OpenID::Store::Filesystem.new('/tmp')
end
