class Taco < ActiveRecord::Base
    belongs_to :user
    has_many :taco_ingredients
    has_many :ingredients, through: :taco_ingredients 
end