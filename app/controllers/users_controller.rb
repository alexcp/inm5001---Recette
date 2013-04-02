class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
  end

  def recettes
    @recettes = current_user.recettes
  end

  def vote_up
    recette = Recette.find params[:recette_id]
    recette.liked_by current_user
    redirect_to recette
  end

  def vote_down
    recette = Recette.find params[:recette_id]
    recette.disliked_by current_user
    redirect_to recette
  end
end
