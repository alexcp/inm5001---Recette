class AddQuantiteToIngredientRecettes < ActiveRecord::Migration
  def change
    add_column :ingredient_recettes, :quantite, :integer
  end
end
