class Recipes < ActiveRecord::Base

    has_many :moods
    has_many :users, through: :moods
    # has_many :favorites, through :users
end