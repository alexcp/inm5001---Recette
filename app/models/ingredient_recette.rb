class IngredientRecette < ActiveRecord::Base
  attr_accessible :nom, :quantite, :unite_de_mesure
  attr_accessor :nom, :quantite, :unite_de_mesure
  validates_presence_of :nom, :quantite, :unite_de_mesure, :ingredient

  belongs_to :ingredient
  belongs_to :recette
  
  before_validation :assigne_un_ingredient

  def assigne_un_ingredient
    if
      self.ingredient = trouve_lingredient_correspondante
    else
      errors.add :nom, "Recette Introuvable"
    end
  end

  def trouve_lingredient_correspondante
    Ingredient.find_by_nom(nom)
  end
end
