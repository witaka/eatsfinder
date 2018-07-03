class V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :user_name, :full_name, :email, :latitude, 
  :longitude, :image_url, :favorite_dishes

  def image_url
    if(object.image_blob)
       object.image_blob.service_url
    end
  end

  def favorite_dishes
    object.favorite_dishes
  end
 end
 