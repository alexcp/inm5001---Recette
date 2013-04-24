require 'digest'

class User < ActiveRecord::Base
  acts_as_voter
  has_many :recettes
  attr_accessible :admin

  def self.from_omniauth auth
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth[:provider]
      user.uid = auth[:uid]
      user.name = auth[:info][:name]
      user.oauth_token = auth[:credentials][:token]
      user.gravatar = "http://www.gravatar.com/avatar/#{calculate_gravatar_hash auth[:info][:email]}"
      user.save!
    end
  end

  def real_user?
    true
  end

  protected

  def self.calculate_gravatar_hash email
    Digest::MD5.hexdigest email.strip.downcase
  end
end
