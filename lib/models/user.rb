class User < ActiveRecord::Base
  has_many :favorites
  has_many :moods
  has_many :recipes, through: :moods
end
