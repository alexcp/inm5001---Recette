class IngredientRecette < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :recette
end
