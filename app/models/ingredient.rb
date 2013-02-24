
# encoding: utf-8
class Ingredient < ActiveRecord::Base
  attr_accessible :nom , :categorie, :prix , :portion ,  :proteine , :glucide, :fat ,:mesure
  validates :nom,:presence => true, :uniqueness => { :case_sensitive => false } , :length => { :maximum => 6 }


  UNITE_DE_MESURE = ["gramme","mililitre","litre","cuilliere a table","cuilliere a the","tasse"]

  def obtenir_unite_de_mesure
    UNITE_DE_MESURE[mesure]
  end

  def valeur_de_unite unite_en_mot
    UNITE_DE_MESURE.index unite_en_mot
  end

 

end
