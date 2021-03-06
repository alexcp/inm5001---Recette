# encoding: utf-8
class IngredientsController < ApplicationController
  # GET /ingredients
  # GET /ingredients.json
  def index
    @requete = params["recherche"]
    if @requete.nil?
    @ingredients = Ingredient.all
    else  
    @requete = params["recherche"]["requete"]  
    @ingredients = Ingredient.where("nom LIKE ?","%#{@requete}%")
    end 
    respond_to do |format|
      format.html 
      format.json { render json: @ingredients}
    end
  end

  # GET /ingredients/1
  # GET /ingredients/1.json
  def show
    @ingredient = Ingredient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ingredient }
    end
  end

  # GET /ingredients/new
  # GET /ingredients/new.json
  def new
    @ingredient = Ingredient.new

    respond_to do |format|
      format.html #{ render layout: false}
      format.json { render json: @ingredient }
    end
  end

  # GET /ingredients/1/edit
  def edit
    @ingredient = Ingredient.find(params[:id])
    @ingredient.ingredient_recettes.build
  end

  # POST /ingredients
  # POST /ingredients.json
  def create
    @ingredient = Ingredient.new(params[:ingredient])

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to ingredients_url, :flash => {:notice => "La ingredient à été enregistré."} }
        format.json { render json: @ingredient, status: :created, location: @ingredient }
      else
        format.html { render action: "new" }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ingredients/1
  # PUT /ingredients/1.json
  def update
    @ingredient = Ingredient.find(params[:id])

    respond_to do |format|
      if @ingredient.update_attributes(params[:ingredient])
        format.html { redirect_to ingredients_url, :flash => {:notice => "La ingredient à été enregistré."} }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients/1
  # DELETE /ingredients/1.json
  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy

    respond_to do |format|
      format.html { redirect_to ingredients_url }
      format.json { head :no_content }
    end
  end
end
