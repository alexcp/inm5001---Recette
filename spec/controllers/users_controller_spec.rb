require 'spec_helper'

describe UsersController do
  before(:each) do
    @user = FactoryGirl.create(:user)
    controller.stub(:current_user=>@user)
  end

  describe "GET 'recettes'" do
    it "returns http success" do
      get 'recettes'
      response.should be_success
    end
  end

end
