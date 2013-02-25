# encoding: utf-8
class Ingredient < ActiveRecord::Base
  attr_accessible :nom, :unite_de_mesure,:portion,:prix,:proteine,:glucide,:gras
  has_many :ingredient_recettes

  validates_presence_of :unite_de_mesure
  validates :nom, :presence => true, :uniqueness => { :case_sensitive => false }

  UNITE_DE_MESURE = ["gramme","mililitre","litre","cuillière à table","cuillière a thé","tasse"]

  def obtenir_unite_de_mesure
    UNITE_DE_MESURE[unite_de_mesure]
  end

  def valeur_de_unite unite_en_mot
    UNITE_DE_MESURE.index unite_en_mot
  end
end
