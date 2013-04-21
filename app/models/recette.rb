class Recette < ActiveRecord::Base
  acts_as_votable
  acts_as_commentable
  attr_accessible :titre, :description, :preparation, :ingredient_recettes_attributes, :etapes_attributes, :temperature_cuisson, :photo

  has_attached_file :photo, :default_url => "defaultRecipe.jpg",  :styles => {
    :thumb=> "100x100#",
    :small  => "150x150>",
    :medium => "200x200>",
    :large =>   "400x400>" }

  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/jpg']

  belongs_to :user 
  
  validates_presence_of :titre, :user_id
  
  has_many :ingredient_recettes 
  validates :ingredient_recettes, :presence => true
  accepts_nested_attributes_for :ingredient_recettes, :allow_destroy => true

  has_many :etapes
  validates :etapes, :presence => true
  accepts_nested_attributes_for :etapes, :allow_destroy => true

  has_many :comments 


end
