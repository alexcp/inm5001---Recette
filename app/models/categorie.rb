class Categorie < ActiveRecord::Base
  attr_accessible :sans_lactose, :sans_gluten, :sans_noix, :congelable, :cachere, :vegetarien
  validates_presence_of :recette_id
  belongs_to :recette
end
