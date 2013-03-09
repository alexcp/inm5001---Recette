class AddDataToRecettes < ActiveRecord::Migration
  def change
    add_column :recettes, :user_id, :integer
    add_column :recettes, :titre, :string
    add_column :recettes, :description, :string
    add_column :recettes, :preparation, :text
    add_column :recettes, :temps_preparation, :text
    add_column :recettes, :temps_cuisson, :text
    add_column :recettes, :temperature_cuisson, :text
  end
end
