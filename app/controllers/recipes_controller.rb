class RecipesController < ApplicationController

  def create
    @recipe = Recipe.new(params[:recipe])
    @recipe.created_at = Time.now # HACK
    @recipe.user_id = 0 # HACK
    if @recipe.save
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(params[:recipe])
      redirect_to :action => 'show', :id => @recipe
    else
      render :action => 'edit'
    end
  end

  def list
    @recipes = Recipe.find(:all)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def delete
    Recipe.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

end
