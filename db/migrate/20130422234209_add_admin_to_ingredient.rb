class AddAdminToIngredient < ActiveRecord::Migration
  def change
  	add_column :ingredients, :admin , :boolean , :defaut => 0
  end
end
