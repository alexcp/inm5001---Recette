class ChangePrixSpecialType < ActiveRecord::Migration
  def up
  	change_column :ingredients, :prix_special , :decimal
  end

  def down
  	change_column :ingredients, :prix_special , :boolean
  end
end
