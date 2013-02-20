class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :nom
      t.string :unite_de_mesure

      t.timestamps
    end
  end
end
