class Etape < ActiveRecord::Base
  attr_accessible :id, :numero, :description, :recette_id

  belongs_to :recette

  validates_presence_of :description
end
