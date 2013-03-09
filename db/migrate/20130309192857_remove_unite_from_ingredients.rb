class RemoveUniteFromIngredients < ActiveRecord::Migration
  def up
    remove_column :ingredients, :unite_de_mesure
  end

  def down
    add_column :ingredients, :unite_de_mesure, :string
  end
end
