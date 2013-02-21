class IngredientsController < ApplicationController
 respond_to :html, :json
def show

@ingredient = Ingredient.find(params[:id])
end

 def index
    @ingredient  = Ingredient.new
    @ingredients = Ingredient.all

    respond_with @ingredients
 end


def create 
   i = Ingredient.new( nom:"New#{rand(1000)}" )
   i.save
   @ingredients = Ingredient.all

    respond_with @ingredients
end   


def go
   @test = "Hello you"
    respond_to do |format|
        format.js
    end
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
