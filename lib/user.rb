class User < ActiveRecord::Base
    has_many :tacos
    has_many :taco_ingredients, through: :tacos 
    has_many :ingredients, through: :taco_ingredients
end