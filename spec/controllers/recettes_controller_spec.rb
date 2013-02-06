require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe RecettesController do

  # This should return the minimal set of attributes required to create a valid
  # Recette. As you add validations to Recette, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {  }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RecettesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all recettes as @recettes" do
      recette = Recette.create! valid_attributes
      get :index, {}, valid_session
      assigns(:recettes).should eq([recette])
    end
  end

  describe "GET show" do
    it "assigns the requested recette as @recette" do
      recette = Recette.create! valid_attributes
      get :show, {:id => recette.to_param}, valid_session
      assigns(:recette).should eq(recette)
    end
  end

  describe "GET new" do
    it "assigns a new recette as @recette" do
      get :new, {}, valid_session
      assigns(:recette).should be_a_new(Recette)
    end
  end

  describe "GET edit" do
    it "assigns the requested recette as @recette" do
      recette = Recette.create! valid_attributes
      get :edit, {:id => recette.to_param}, valid_session
      assigns(:recette).should eq(recette)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Recette" do
        expect {
          post :create, {:recette => valid_attributes}, valid_session
        }.to change(Recette, :count).by(1)
      end

      it "assigns a newly created recette as @recette" do
        post :create, {:recette => valid_attributes}, valid_session
        assigns(:recette).should be_a(Recette)
        assigns(:recette).should be_persisted
      end

      it "redirects to the created recette" do
        post :create, {:recette => valid_attributes}, valid_session
        response.should redirect_to(Recette.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved recette as @recette" do
        # Trigger the behavior that occurs when invalid params are submitted
        Recette.any_instance.stub(:save).and_return(false)
        post :create, {:recette => {  }}, valid_session
        assigns(:recette).should be_a_new(Recette)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Recette.any_instance.stub(:save).and_return(false)
        post :create, {:recette => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested recette" do
        recette = Recette.create! valid_attributes
        # Assuming there are no other recettes in the database, this
        # specifies that the Recette created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Recette.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => recette.to_param, :recette => { "these" => "params" }}, valid_session
      end

      it "assigns the requested recette as @recette" do
        recette = Recette.create! valid_attributes
        put :update, {:id => recette.to_param, :recette => valid_attributes}, valid_session
        assigns(:recette).should eq(recette)
      end

      it "redirects to the recette" do
        recette = Recette.create! valid_attributes
        put :update, {:id => recette.to_param, :recette => valid_attributes}, valid_session
        response.should redirect_to(recette)
      end
    end

    describe "with invalid params" do
      it "assigns the recette as @recette" do
        recette = Recette.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Recette.any_instance.stub(:save).and_return(false)
        put :update, {:id => recette.to_param, :recette => {  }}, valid_session
        assigns(:recette).should eq(recette)
      end

      it "re-renders the 'edit' template" do
        recette = Recette.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Recette.any_instance.stub(:save).and_return(false)
        put :update, {:id => recette.to_param, :recette => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested recette" do
      recette = Recette.create! valid_attributes
      expect {
        delete :destroy, {:id => recette.to_param}, valid_session
      }.to change(Recette, :count).by(-1)
    end

    it "redirects to the recettes list" do
      recette = Recette.create! valid_attributes
      delete :destroy, {:id => recette.to_param}, valid_session
      response.should redirect_to(recettes_url)
    end
  end

end
