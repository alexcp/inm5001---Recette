# encoding: utf-8
class SessionsController < ApplicationController
  def create
    user = User.from_omniauth env["omniauth.auth"]
    session[:user_id] = user.id
    flash[:notice] = "Vous êtes maintenant connecté."
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Vous êtes maintenant déconnecté."
    redirect_to root_url
  end

  def error
    flash[:error] = "Oups! Une erreur est survenue, veuillez recommencer."
    redirect_to root_url
  end
end
