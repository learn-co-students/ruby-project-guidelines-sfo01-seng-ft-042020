class Ingredient < ActiveRecord::Base
    has_many :taco_ingredients 
    has_many :tacos, through: :taco_ingredients
    has_many :users, through: :tacos 

end