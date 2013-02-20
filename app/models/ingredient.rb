class Ingredient < ActiveRecord::Base
  attr_accessible :nom, :unite_de_mesure

  has_many :ingredient_recette
  validates_presence_of :nom, :unite_de_mesure
end
