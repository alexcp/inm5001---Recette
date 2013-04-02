class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
  end

  def recettes
    @recettes = current_user.recettes
  end
end
