class CreateRecettes < ActiveRecord::Migration
  def change
    create_table :recettes do |t|
  	  t.string :temps_preparation
      t.string :temps_cuisson
      t.string :temperature_cuisson
      t.timestamps
    end
  end
end
