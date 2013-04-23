class IngredientRecette < ActiveRecord::Base
  attr_accessible :nom, :portion, :unite_de_mesure, :recette_id, :quantite, :portion
  belongs_to :ingredient
  belongs_to :recette 

  validates_presence_of :nom, :quantite, :unite_de_mesure, :ingredient

  before_validation :assigne_un_ingredient

  UNITE_DE_RECHERCHE = [:Titre,:Ingredient]

  def assigne_un_ingredient
    self.ingredient = trouve_ou_cree_ingredient
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

  def tooltip()
    Ingredient.find_by_nom(nom).tooltip();
  end  

  def admin?()
    Ingredient.find_by_nom(nom).admin;
  end  

  def special_tooltip()
    Ingredient.find_by_nom(nom).special_tooltip();
  end  
  
  def special?()
    Ingredient.find_by_nom(nom).special;
  end  

  private

  def trouve_ou_cree_ingredient
    if nom!=""
      Ingredient.find_by_nom(nom) || Ingredient.create!( nom: nom )
    else
      
    end
  end


end
