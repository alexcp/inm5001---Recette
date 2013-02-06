class CreateRecipes < ActiveRecord::Migration
  def self.up
     create_table :recipes do |t|
	t.column :name, :string, :limit => 80, :null => false
	t.column :description, :text, :null => false
	t.column :details, :text, :null => false
	t.column :user_id, :text, :null => false
	t.column :created_at, :timestamp, :null => false
     end
  end

  def self.down
    drop_table :recipes
  end
end