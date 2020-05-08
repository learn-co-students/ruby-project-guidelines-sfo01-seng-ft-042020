class TacoIngredient < ActiveRecord::Base
    belongs_to :taco 
    belongs_to :ingredient
end     