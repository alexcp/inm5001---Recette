class Ingredient < ActiveRecord::Base
  attr_accessible :nom , :categorie, :prix , :portion ,  :proteine , :glucide, :fat

validates :nom,:presence => true, :uniqueness => { :case_sensitive => false } , :length => { :maximum => 6 }



end
