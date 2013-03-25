class IngredientRecette < ActiveRecord::Base
  attr_accessible  :nom, :portion, :unite_de_mesure, :recette_id
  attr_accessor  :nom, :portion, :unite_de_mesure, :recette_id
  validates_presence_of :ingredient_id, :recette_id, :nom, :portion, :unite_de_mesure
 

  belongs_to :ingredient
  belongs_to :recette 
 

  before_validation :assigne_un_ingredient, :go

  UNITE_DE_MESURE = ["gramme(s)","mililitre(s)","litre(s)","cuilliere(s) a table","cuilliere(s) a the","tasse(s)", "unite(s)", "douzaine(s)"]
  UNITE_DE_RECHERCHE = [:Titre,:Ingredient]

 def go
  p self
 end

  def nom=(nom)
    @nom=nom
  end

  def nom
    ingredient =  trouve_lingredient_correspondante
    if  ingredient.nil?
        @nom=  nil
    else
        @nom =ingredient.nom 
    end
  end
 
  def obtenir_unite_de_mesure
    UNITE_DE_MESURE[unite_de_mesure]
  end

  def valeur_de_unite unite_en_mot
    UNITE_DE_MESURE.index unite_en_mot
  end

  def assigne_un_ingredient
 
  ingredient = Ingredient.where('nom LIKE ?', @nom).first

  if ingredient.nil?
    ingredient= Ingredient.new
    ingredient.nom= @nom
    ingredient.save
  end
  
  self.ingredient_id =  ingredient.id
  end

  def trouve_lingredient_correspondante
    if self.ingredient_id.nil?
      ingredient= nil
    else
      ingredient = Ingredient.find(self.ingredient_id)
    end 
  end

  def self.search(search, recherche)
    if search
      if recherche==:titre 
        self.searchByIngredient(search)
      else
        self.searchByTitle(search)
      end
    else
      find(:all)
    end
  end


  def self.searchByIngredient(search)
    p "d"
    if search
      joins(:recettes => :recette_id).find(:all, :conditions => ['titre LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

   def self.searchByTitle(search)
    p "d"
    if search
       Recette.joins(:ingredient_recettes).find(:all)
    else
      find(:all)
    end
  end

  
end
