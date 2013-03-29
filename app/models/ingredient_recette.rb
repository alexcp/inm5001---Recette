class IngredientRecette < ActiveRecord::Base
  attr_accessible  :nom, :portion, :unite_de_mesure, :recette_id, :quantite, :portion
  attr_accessor  :nom, :portion, :unite_de_mesure, :recette_id
  validates_presence_of :nom, :portion, :unite_de_mesure

  belongs_to :ingredient
  belongs_to :recette 

  before_validation :assigne_un_ingredient

  UNITE_DE_RECHERCHE = [:Titre,:Ingredient]

  def assigne_un_ingredient
    self.ingredient = trouve_lingredient_correspondante
    errors.add(:nom, "Recette Introuvable") unless self.ingredient
  end

  def trouve_lingredient_correspondante
    Ingredient.find_by_nom(nom)
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
    if search
      joins(:recettes => :recette_id).find(:all, :conditions => ['titre LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

  def self.searchByTitle(search)
    if search
      Recette.joins(:ingredient_recettes).find(:all)
    else
      find(:all)
    end
  end
end
