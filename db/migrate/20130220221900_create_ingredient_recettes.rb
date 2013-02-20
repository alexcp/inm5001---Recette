class CreateIngredientRecettes < ActiveRecord::Migration
  def change
    create_table :ingredient_recettes do |t|
      t.integer :ingredient_id, :null => false
      t.integer :recette_id, :null => false

      t.timestamps
    end
  end
end
