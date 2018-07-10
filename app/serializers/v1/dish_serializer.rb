class V1::DishSerializer < ActiveModel::Serializer
 attributes(
  :id,
  :name,
  :dish_type,
  :description,
  :price,
  :latitude,
  :longitude,
  :image_url,
  :likes_number,
  :favoris_number,
  :likers,
  :favoris,
  :provider,
  :provider_image_url
  )


  def provider_image_url
    if(object.provider.image_blob)
       object.provider.image_blob.service_url
    end
  end

   def provider
      object.provider
   end

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

  def likers
    str =''
    object.likers.each do |like|
      str += like.user_name + ' <br> '
    end
    str
  end

  def favoris_number
    object.favoris.count
  end

  def favoris
    str =''
    object.favoris.each do |like|
      str += like.user_name + ' <br> '
    end
    str
  end

  has_many :reviews

  class ReviewSerializer < ActiveModel::Serializer
    attributes :id, :body, :rating, :user_name

    def user_name
      object.user.user_name
    end

  end

end
