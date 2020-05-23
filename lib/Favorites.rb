class Favorites < ActiveRecord::Base
    
    belongs_to :user
    has_many :recipes through :user
   
end