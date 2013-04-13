class HomeController < ApplicationController
  def index
    @search = Recette.search(params[:q])
    render "index", layout: false
  end
end
