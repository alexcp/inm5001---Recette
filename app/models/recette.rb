class Recette < ActiveRecord::Base
  acts_as_votable
  acts_as_commentable
  attr_accessible :titre, :description, :preparation, :ingredient_recettes_attributes, :etapes_attributes, :temperature_cuisson, :photo

  has_attached_file :photo, :default_url => "defaultRecipe.jpg",  :styles => {
    :thumb=> "100x100#",
    :small  => "150x150>",
    :medium => "200x200>",
    :large =>   "400x400>" }

  #validates_associated :ingredient_recettes
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/jpg']

  belongs_to :user 

  has_many :ingredient_recettes 
  validates :etapes, :presence => {:message => 'Il doit y avoir au moins 1 ingrédient dans votre recette.'}

  has_many :etapes
  validates :etapes, :presence => {:message => 'Il doit y avoir au moins 1 étape dans votre recette.'}

  has_many :comments 
  validates_presence_of :titre, :user_id

  #validates_existence_of :etapes, :ingredient_recettes
  accepts_nested_attributes_for :ingredient_recettes, :allow_destroy => true
  accepts_nested_attributes_for :etapes, :allow_destroy => true

end
