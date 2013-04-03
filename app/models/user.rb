class User < ActiveRecord::Base
  acts_as_voter
  has_many :recettes

  def self.from_omniauth auth
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth[:provider]
      user.uid = auth[:uid]
      user.name = auth[:info][:name]
      user.oauth_token = auth[:credentials][:token]
      user.save!
    end
  end

  def real_user?
    true
  end
end
