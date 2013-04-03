class RechercheController < ApplicationController
  def show
    @recettes = Recette.where("titre LIKE ?","%#{params[:q]}%")
    respond_to do |format|
      format.html 
      format.json { render json: @recettes }
    end
  end

  def ingredient
    @recettes = Ingredient.where("nom LIKE ?","%#{params[:q]}%")
    render json: @recettes
  end
end
