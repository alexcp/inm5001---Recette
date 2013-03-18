class IngredientRecette < ActiveRecord::Base
  attr_accessible :nom, :portion, :unite_de_mesure
  attr_accessor :nom, :portion, :unite_de_mesure
  validates_presence_of :nom, :portion, :unite_de_mesure, :ingredient

  belongs_to :ingredient
  belongs_to :recette
  
  before_validation :assigne_un_ingredient

  UNITE_DE_MESURE = ["gramme(s)","mililitre(s)","litre(s)","cuilliere(s) a table","cuilliere(s) a the","tasse(s)", "unite(s)", "douzaine(s)"]

  def obtenir_unite_de_mesure
    UNITE_DE_MESURE[unite_de_mesure]
  end

  def valeur_de_unite unite_en_mot
    UNITE_DE_MESURE.index unite_en_mot
  end

  def assigne_un_ingredient
  true
  end

  def trouve_lingredient_correspondante
   true
  end
end
