class User < ActiveRecord::Base
    has_many :tacos
    has_many :ingredients, through: :tacos
end