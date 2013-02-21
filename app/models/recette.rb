class Recette < ActiveRecord::Base
  attr_accessible :titre, :description, :preparation, :ingredient_recettes_attributes

  belongs_to :user
  has_many :ingredient_recettes
  validates_presence_of :titre, :description, :preparation, :user_id
  accepts_nested_attributes_for :ingredient_recettes, :allow_destroy => true
end
