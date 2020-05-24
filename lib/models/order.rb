class Order < ActiveRecord::Base
    belongs_to :recipes
    belongs_to :ingredients
    belongs_to :units
    has_one :user, through: :recipes
end