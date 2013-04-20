class AddToEtapes < ActiveRecord::Migration
  def change
    add_column :etapes, :no,    :integer
    add_column :etapes, :description,    :string
    add_column :etapes, :recette_id, :integer
  end
end
