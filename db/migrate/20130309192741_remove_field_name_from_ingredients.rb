class RemoveFieldNameFromIngredients < ActiveRecord::Migration
  def up
    remove_column :ingredients, :portion
  end

  def down
    add_column :ingredients, :portion, :string
  end
end
