class User < ApplicationRecord
  has_secure_password()

  validates :user_name, :full_name, presence: true
  
  validates
  (
    :email, presence: true,
    uniqueness: true,
    format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  )
end
