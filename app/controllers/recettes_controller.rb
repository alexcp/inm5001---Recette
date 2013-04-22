# encoding: utf-8
class RecettesController < ApplicationController
  # GET /recettes
  # GET /recettes.json
  def index
    @search = Recette.search(params[:q])
    @recettes = @search.result
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recettes }
    end
  end

  # GET /recettes/1
  # GET /recettes/1.json
  def show
    @recette = Recette.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recette }
    end
  end

  # GET /recettes/new
  # GET /recettes/new.json
  def new
    p params
    begin
      if params[:recette_id].nil?
      @recette = current_user.recettes.new
      else
      @recette = Recette.cloner(params[:recette_id])
      end
    rescue NoMethodError
      render "users/new", :flash => {:error => "Vous devez être enregistré."}
      return
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recette }
    end
  end

  # GET /recettes/1/edit
  def edit
    if current_user.recettes.nil?
     redirect_to root_url, :flash => {:error => "Oups, mauvais chemin"}
    else
      @recette = current_user.recettes.find(params[:id])
      if @recette.nil?
      redirect_to root_url, :flash => {:error => "Oups, mauvais chemin"}
      end
    end  
  end

  # POST /recettes
  # POST /recettes.json
  def create
    @recette = current_user.recettes.new(params[:recette])
    respond_to do |format|
      if @recette.save
        format.html { redirect_to @recette, :flash => {:notice => "La recette a été enregistré."} }
        format.json { render json: @recette, status: :created, location: @recette }
      else
        format.html { render action: "new" }
        format.json { render json: @recette.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recettes/1
  # PUT /recettes/1.json
  def update
    @recette = current_user.recettes.find(params[:id])
    respond_to do |format|
      if @recette.update_attributes(params[:recette])
        format.html { redirect_to @recette, :flash => {:notice => "La recette a été enregistré."} }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recette.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recettes/1
  # DELETE /recettes/1.json
  def destroy
    @recette = current_user.recettes.find(params[:id])
    @recette.destroy

    respond_to do |format|
      format.html { redirect_to recettes_url }
      format.json { head :no_content }
    end
  end

  def cloner 
    @recette = Recette.find(params[:recette_id]).dup
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: "/recettes" }
    end
  end  
end
