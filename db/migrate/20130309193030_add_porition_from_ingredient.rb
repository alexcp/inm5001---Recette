class AddPoritionFromIngredient < ActiveRecord::Migration
  def change
    add_column :ingredient_recettes, :portion, :string
  end
end
