class Recette < ActiveRecord::Base
  attr_accessible :titre, :description, :preparation, :ingredient_recettes_attributes, :temps_preparation, :temps_cuisson, :temperature_cuisson, :photo
  has_attached_file :photo, :default_url => "defaultRecipe.jpg",  :styles => {
    :thumb=> "100x100#",
    :small  => "150x150>",
    :medium => "300x300>",
    :large =>   "400x400>" }


validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/jpg']



  belongs_to :user
  has_many :ingredient_recettes
  validates_presence_of :titre, :preparation, :temps_preparation, :temps_cuisson, :user_id
  accepts_nested_attributes_for :ingredient_recettes, :allow_destroy => true

def self.search(search)
  if search
    find(:all, :conditions => ['preparation LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end

end
