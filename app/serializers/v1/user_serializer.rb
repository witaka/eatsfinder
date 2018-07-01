class V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :user_name, :full_name, :email, :latitude, 
  :longitude, :image_url

  def image_url
    if(object.image_blob)
       object.image_blob.service_url
    end
  end
 end
 