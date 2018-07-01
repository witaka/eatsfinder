class Review < ApplicationRecord
  belongs_to :dish
  belongs_to :user

    validates(
    :body,
    presence: {
      message: "Please provide your review" 
    },
    length: {
      minimum: 5, maximum: 100
    }
  )

end

