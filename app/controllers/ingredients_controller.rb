class IngredientsController < ApplicationController
 respond_to :html, :json, :js
def show

@ingredient = Ingredient.find(params[:id])
end

 def index
    @ingredients = Ingredient.all
    respond_with @ingredients
 end

def create
  @ingredient  = Ingredient.new
  @ingredient.nom = "sss5"
  @ingredient.save
  @ingredients = Ingredient.all
  puts ingredients_url  
  respond_with  @ingredients , :location => ingredients_url
end



def update
 @ingredient = Ingredient.find(params[:id])
    
   respond_to do |format|
    if  @ingredient.update_attributes(params[:ingredient])
      format.html { redirect_to( @ingredient, :notice => 'User was successfully updated.') }
      format.json { respond_with_bip( @ingredient) }
    else
      format.html { render :action => "edit" }
      format.json { respond_with_bip( @ingredient) }
    end
  end
  
  
end


end
