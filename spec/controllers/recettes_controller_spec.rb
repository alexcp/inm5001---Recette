require 'spec_helper'
describe RecettesController do

  def valid_attributes
    {
      titre: "Recette", 
      description: "Lorem Ipsum", 
      preparation: "Lorem Ipsum",
      ingredient_recettes_attributes: {
        new_1361401779748:{
          nom: "beurre",
          quantite: "50",
          portion: 2,
          unite_de_mesure: "gramme",
          _destroy: "false" 
        }
      }
    }
  end

  def valid_session
    {}
  end

  before(:each) do
    user = FactoryGirl.create(:user)
    controller.stub(:current_user=>user)
    Ingredient.stub(:find_by_nom=>mock_model(Ingredient))
  end

  it "should have a current user" do
    controller.send(:current_user).should_not be_nil
  end

  describe "GET index" do
    it "assigns all recettes as @recettes" do
      recette = controller.send(:current_user).recettes.create! valid_attributes
      get :index, {}, valid_session
      assigns(:recettes).should eq([recette])
    end
  end

  describe "GET show" do
    it "assigns the requested recette as @recette" do
      recette = controller.send(:current_user).recettes.create! valid_attributes
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
      recette = controller.send(:current_user).recettes.create! valid_attributes
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
        recette = controller.send(:current_user).recettes.create! valid_attributes
        # Assuming there are no other recettes in the database, this
        # specifies that the Recette created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Recette.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => recette.to_param, :recette => { "these" => "params" }}, valid_session
      end

      it "assigns the requested recette as @recette" do
        recette = controller.send(:current_user).recettes.create! valid_attributes
        put :update, {:id => recette.to_param, :recette => valid_attributes}, valid_session
        assigns(:recette).should eq(recette)
      end

      it "redirects to the recette" do
        recette = controller.send(:current_user).recettes.create! valid_attributes
        put :update, {:id => recette.to_param, :recette => valid_attributes}, valid_session
        response.should redirect_to(recette)
      end
    end

    describe "with invalid params" do
      it "assigns the recette as @recette" do
        recette = controller.send(:current_user).recettes.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Recette.any_instance.stub(:save).and_return(false)
        put :update, {:id => recette.to_param, :recette => {  }}, valid_session
        assigns(:recette).should eq(recette)
      end

      it "re-renders the 'edit' template" do
        recette = controller.send(:current_user).recettes.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Recette.any_instance.stub(:save).and_return(false)
        put :update, {:id => recette.to_param, :recette => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested recette" do
      recette = controller.send(:current_user).recettes.create! valid_attributes
      expect {
        delete :destroy, {:id => recette.to_param}, valid_session
      }.to change(Recette, :count).by(-1)
    end

    it "redirects to the recettes list" do
      recette = controller.send(:current_user).recettes.create! valid_attributes
      delete :destroy, {:id => recette.to_param}, valid_session
      response.should redirect_to(recettes_url)
    end
  end

end
