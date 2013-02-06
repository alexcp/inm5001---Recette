class Recette < ActiveRecord::Base
  attr_accessible :titre, :description, :preparation    
  validates_presence_of :titre, :description, :preparation, :user_id
  belongs_to :user
end
