class AddSpecialToIngredient < ActiveRecord::Migration
  def change
  	add_column :ingredients, :special , :boolean , :defaut => 0
  	add_column :ingredients, :prix_special , :boolean
  	add_column :ingredients, :epicerie , :string
  end
end
