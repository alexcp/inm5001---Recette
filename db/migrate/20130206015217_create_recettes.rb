class CreateRecettes < ActiveRecord::Migration
  def change
    create_table :recettes do |t|

      t.timestamps
    end
  end
end
