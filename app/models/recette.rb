class Recette < ActiveRecord::Base
  attr_accessible :titre, :description, :preparation    

  belongs_to :user
  has_many :ingredient_recette
  validates_presence_of :titre, :description, :preparation, :user_id
end
