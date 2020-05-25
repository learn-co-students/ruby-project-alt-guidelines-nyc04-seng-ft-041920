class Recipe < ActiveRecord::Base
  belongs_to :moods
  has_many :users, through: :moods
end
