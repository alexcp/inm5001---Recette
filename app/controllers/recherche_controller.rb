class RechercheController < ApplicationController
  before_filter :get_requete

  def get_requete
    @requete = params[:recherche["requete"]]
  end

  def show
    @recettes = Recette.where("titre LIKE ?","%#{@requete}%")
    respond_to do |format|
      format.html 
      format.json { render json: @recettes }
    end
  end

  def ingredient
    @recettes = Ingredient.where("nom LIKE ?","%#{@requete}%")
    render json: @recettes
  end
end
