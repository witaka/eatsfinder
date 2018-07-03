class Favorite < ApplicationRecord
  
  belongs_to :dish
  belongs_to :user
  validates :dish_id, uniqueness: { scope: :user_id }
  
end
