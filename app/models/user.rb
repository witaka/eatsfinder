class User < ApplicationRecord
  has_secure_password()
  has_many :providers, dependent: :destroy
  has_many :dishes, dependent: :destroy
  has_many :users, dependent: :destroy
  has_one_attached :image

  has_many :likes, dependent: :destroy
  has_many :liked_dishes, through: :likes, source: :dish  
  
  has_many :favorites, dependent: :destroy
  has_many :favorite_dishes, through: :favorites, source: :dish  

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  
  validates :user_name, :full_name, presence: true, uniqueness: {case_sensitive: false}
  
  validates(
    :email,
    presence: true,
    uniqueness: true,
    uniqueness: {case_sensitive: false},
    format: {
      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
    }
  )

  after_validation { self.errors.messages.delete(:password_digest) }
  
end
