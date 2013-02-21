class IngredientRecette < ActiveRecord::Base
  attr_accessible :nom, :quantite, :unite_de_mesure
  attr_accessor :nom, :quantite, :unite_de_mesure

  belongs_to :ingredient
  belongs_to :recette
  
  before_save :assigne_un_ingredient

  def assigne_un_ingredient
    self.ingredient = trouve_lingredient_correspondante
  end

  def trouve_lingredient_correspondante
    Ingredient.find_by_nom(nom)
  end
end
