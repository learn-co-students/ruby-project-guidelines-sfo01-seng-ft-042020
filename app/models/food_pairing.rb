class FoodPairing < ActiveRecord::Base
  has_and_belongs_to_many :beers

end