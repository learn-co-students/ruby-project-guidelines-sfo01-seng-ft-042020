class User < ActiveRecord::Base
    has_many :plays
    has_many :questions, through: :plays
end