OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  require 'openid/store/filesystem' 
  # These API Key are now deactivated.
  # If you want to use the app. Get new keys and store them in Environement Variables.
  #provider :facebook, "273444086117075", "1d9fd55d0a190557c006971b5c26a128"
  #provider :twitter, "tQkoVVNGEidkTIAuqkUg", "sRqCilCoYQ35NBimaH9K3n83q5g9UoJqK6t470YBw"
end
