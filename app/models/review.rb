class Review < ApplicationRecord
  belongs_to :dish

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

