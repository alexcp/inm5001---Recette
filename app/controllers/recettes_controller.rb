# encoding: utf-8
class RecettesController < ApplicationController
  # GET /recettes
  # GET /recettes.json
  def index
    @recettes = Recette.all

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
    begin
      @recette = current_user.recettes.new
    rescue NoMethodError
      redirect_to root_path, :flash => {:error => "Vous devez être enregistré."}
      return
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recette }
    end
  end

  # GET /recettes/1/edit
  def edit
    @recette = current_user.recettes.find(params[:id])
  end

  # POST /recettes
  # POST /recettes.json
  def create
    @recette = current_user.recettes.new(params[:recette])

    respond_to do |format|
      if @recette.save
        format.html { redirect_to @recette, :flash => {:notice => "La recette à été enregistré."} }
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
        format.html { redirect_to @recette, :flash => {:notice => "La recette à été enregistré."} }
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
end
