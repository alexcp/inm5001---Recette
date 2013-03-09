class AddUniteFromIngredient < ActiveRecord::Migration
  def change
    add_column :ingredient_recettes, :unite_de_mesure, :string
  end
end
