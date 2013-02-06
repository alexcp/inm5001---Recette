class Recipe < ActiveRecord::Base
	attr_accessible :name, :created_at, :description, :details, :user_id

	belongs_to :user
	has_many :ingredients

end