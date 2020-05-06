class Question < ActiveRecord::Base
    has_many :plays
    has_many :users, through: :plays
end