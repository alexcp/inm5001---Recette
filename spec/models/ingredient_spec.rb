require 'spec_helper'

describe Ingredient do

  describe "validation" do
    subject {Ingredient.new(:nom=>"beurre",:unite_de_mesure=>"litre")}
    it {should be_valid}
  end


end
