class CreateEtapes < ActiveRecord::Migration
  def change
    create_table :etapes do |t|

      t.timestamps
    end
  end
end
