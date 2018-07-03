class Dish < ApplicationRecord
  belongs_to :provider
  belongs_to :user
  has_one_attached :image
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user
  has_many :favorites, dependent: :destroy
  has_many :favoris, through: :favorites, source: :user
 
  
  # validates(:name, presence: true, uniqueness: true)
  # validates(
  #   :description,
  #   presence: {
  #     message: "Please provide a short description about your meal" 
  #   },
  #   length: {
  #     minimum: 5, maximum: 100
  #   }
  # )
  # validates(
  #   :price, {
  #   numericality: { greater_than_or_equal_to: 0 }
  #   }
  # )
  def capitalize_title
    self.name = self.name.capitalize
  end
end
