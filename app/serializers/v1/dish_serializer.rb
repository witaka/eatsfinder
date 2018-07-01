class V1::DishSerializer < ActiveModel::Serializer
 attributes :id, :name, :dish_type, :description, :price, :latitude, :longitude, :image_url, :likes_number

  def latitude
    object.provider.latitude
  end
  
  def longitude
    object.provider.longitude
  end

  def image_url
    if(object.image_blob)
       object.image_blob.service_url
    end
  end

  def likes_number
       object.likers.count
  end

  has_many :reviews

  class ReviewSerializer < ActiveModel::Serializer
    attributes :id, :body, :rating, :user_name

    def user_name
      object.user.user_name
    end
 
  end

end
