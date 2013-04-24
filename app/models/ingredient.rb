# encoding: utf-8
class Ingredient < ActiveRecord::Base
  attr_accessible :id, :nom, :prix, :proteine, :glucide, :gras, :unite_de_mesure, :portion, :admin, :special, :prix_special, :epicerie

  has_many :ingredient_recettes

  validates :nom, :presence => true, :uniqueness =>true

  UNITE_DE_MESURE = ["gramme(s)","mililitre(s)","litre(s)","c. à table","c. à thé","tasse(s)", "unité(s)", "douzaine(s)"]
  EPICIER = ["IGA","MAXI","METRO","PROVIGO", "LOBLAWS", "SUPER C"]
  def obtenir_unite_de_mesure
    UNITE_DE_MESURE[unite_de_mesure]
  end

  def valeur_de_unite unite_en_mot
    UNITE_DE_MESURE.index unite_en_mot
  end

  def tooltip()
    tooltip= "<h4>#{self.nom} : #{self.prix}$</h4><br/> Glucides : #{self.glucide}% <br/> Proteines : #{self.proteine}% <br/> Lipides : #{self.gras}%"
    return tooltip
  end 

  def special_tooltip()
    tooltip= "En rabais chez #{self.epicerie} :  #{self.prix_special}$"
    return tooltip
  end 
end
