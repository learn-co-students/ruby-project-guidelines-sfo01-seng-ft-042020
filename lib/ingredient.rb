class Ingredient < ActiveRecord::Base
    has_many :tacos
    has_many :users, through: :tacos
end