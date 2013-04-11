class RechercheController < ApplicationController
  def show
    #@requete = params["recherche"]["requete"]
    #@recettes = Recette.where("titre LIKE ?","%#{@requete}%")
    @search = Recette.search(params[:q])
    @recettes = Recette.all#@search.result
    respond_to do |format|
      format.html 
      format.json { render json: @recettes }
    end
  end

  def ingredient
    @requete = params[:element]
    @ingredients = Ingredient.where("nom LIKE ?","%#{@requete}%")
    respond_to do |format|
      format.html 
      format.json { render json: @ingredients}
    end
  end
end
