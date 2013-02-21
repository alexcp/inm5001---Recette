class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :nom
      t.string :categorie
      t.string :portion
      t.string :mesure
      t.decimal :prix
      t.integer :proteine
      t.integer :glucide
      t.integer :fat

      t.timestamps
    end
  end
end
