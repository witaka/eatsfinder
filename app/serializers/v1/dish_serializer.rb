class V1::DishSerializer < ActiveModel::Serializer
 attributes :id, :name, :dish_type, :description, :price, :latitude, :longitude, :image_url

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

end
