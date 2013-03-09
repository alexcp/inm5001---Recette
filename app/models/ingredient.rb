# encoding: utf-8
class Ingredient < ActiveRecord::Base
  attr_accessible :nom ,:prix,:proteine,:glucide,:gras
  has_many :ingredient_recettes

  validates :nom, :presence => true, :uniqueness => { :case_sensitive => false }


end
