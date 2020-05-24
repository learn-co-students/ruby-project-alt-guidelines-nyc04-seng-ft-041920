class Recipe < ActiveRecord::Base
    has_many :orders
    belongs_to :users
end