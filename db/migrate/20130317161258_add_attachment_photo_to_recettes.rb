class AddAttachmentPhotoToRecettes < ActiveRecord::Migration
  def self.up
    change_table :recettes do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :recettes, :photo
  end
end
