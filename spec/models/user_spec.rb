require 'spec_helper'

describe User do
  describe "from omniauth" do
    it "should create a user from facebook" do
      facebook_callback_hash = {
        :provider => 'facebook',
        :uid => '1234567',
        :info => {
            :email => 'joe@bloggs.com',
            :name => 'Joe Bloggs',
            :image => 'http://graph.facebook.com/1234567/picture?type=square',
            :location => 'Palo Alto, California'
        },
        :credentials => {
            :token => 'ABCDEF...',
            :expires_at => 1321747205
        }
      }
      User.from_omniauth(facebook_callback_hash).should be_true
      User.count.should_not eq(0)
    end
  end
end
