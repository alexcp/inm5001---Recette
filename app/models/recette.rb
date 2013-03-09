class Recette < ActiveRecord::Base
  attr_accessible :titre, :description, :preparation, :ingredient_recettes_attributes, :temps_preparation, :temps_cuisson, :temperature_cuisson

  belongs_to :user
  has_many :ingredient_recettes
  validates_presence_of :titre, :description, :preparation, :temps_preparation, :temps_cuisson, :temperature_cuisson, :user_id
  accepts_nested_attributes_for :ingredient_recettes, :allow_destroy => true
end
