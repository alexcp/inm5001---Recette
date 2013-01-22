Rails.application.config.middleware.use OmniAuth::Builder do
  require 'openid/store/filesystem' 
  # IMPORTANT: Tout les informations ici doivent être secretes
  provider :facebook, "273444086117075", "1d9fd55d0a190557c006971b5c26a128"
  provider :twitter, "CONSUMER_KEY", "CONSUMER_SECRET"
  provider :openid, :store => OpenID::Store::Filesystem.new('/tmp')
end
