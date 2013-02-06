class AddDataToRecettes < ActiveRecord::Migration
  def change
    add_column :recettes, :user_id, :integer
    add_column :recettes, :titre, :string
    add_column :recettes, :description, :string
    add_column :recettes, :preparation, :text
  end
end
