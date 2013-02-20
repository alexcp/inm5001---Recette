class Ingredient < ActiveRecord::Base
  attr_accessible :nom, :unite_de_mesure

  validates_presence_of :nom, :unite_de_mesure
end
