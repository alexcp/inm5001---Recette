class ChangeAttributeOfIngredientRecettes < ActiveRecord::Migration
  def change
    remove_column :ingredient_recettes, :portion
    add_column :ingredient_recettes, :nom, :string
  end
end
