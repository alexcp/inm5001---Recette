class AddValuesToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :portion, :string
    add_column :ingredients, :prix, :decimal
    add_column :ingredients, :proteine, :integer
    add_column :ingredients, :glucide, :integer
    add_column :ingredients, :gras, :integer
  end
end
