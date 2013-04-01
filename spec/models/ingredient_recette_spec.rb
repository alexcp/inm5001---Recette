require 'spec_helper'

describe IngredientRecette do
  it "should find the corresponding ingredient" do
    @ingredient = mock_model(Ingredient)
    Ingredient.stub(:find_by_nom=>@ingredient)
    ingredient_recette = IngredientRecette.new :nom => "Beurre", :unite_de_mesure => "g", :quantite=> 50
    ingredient_recette.assigne_un_ingredient
    ingredient_recette.ingredient.should_not be_nil
  end

  it "should create a new ingredient if it doesn't exist already" do
    ingredient_recette = IngredientRecette.new :nom => "Beurre", :unite_de_mesure => "g", :quantite=> 50
    ingredient_recette.assigne_un_ingredient
    ingredient_recette.ingredient.should_not be_nil
  end

end
