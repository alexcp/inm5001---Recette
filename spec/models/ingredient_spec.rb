require 'spec_helper'

describe Ingredient do
  describe "validation" do
    subject { Ingredient.new nom:"beurre" }
    it {should be_valid}
  end
end
