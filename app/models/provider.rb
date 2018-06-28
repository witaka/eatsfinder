class Provider < ApplicationRecord
  has_many :dishes, dependent: :destroy
  belongs_to :user
  has_one_attached :image
  
  # validates(:name, presence: true, uniqueness: true)
  # validates(
  #   :email,
  #   presence: true,
  #   uniqueness: true,
  #   format: {
  #     with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
  #   }
  # )

  # validates(
  #   :website,
  #   uniqueness: true,
  #   format: {
  #     with: /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix, on: :create
  #   }
  # )

  # validates(
  #   :description,
  #   presence: {
  #     message: "Please provide a short description about your restaurant" 
  #   },
  #   length: {
  #     minimum: 5, maximum: 100
  #   }
  # )
end
