class V1::ProviderSerializer < ActiveModel::Serializer
  has_many :dishes
  attributes(
    :id,
    :name, 
    :description, 
    :email, 
    :phone_number, 
    :website, 
    :address, 
    :image_url, 
    :latitude, 
    :longitude
  )

  class DishSerializer < ActiveModel::Serializer
    attributes( 
      :id, 
      :name, 
      :dish_type, 
      :description, 
      :price, 
      :image_url,
      :likes_number,
      :favoris_number
    )


    def likes_number
      object.likers.count
    end

    def favoris_number
      object.favoris.count
    end
    
    def image_url
      if(object.image_blob)
         object.image_blob.service_url
      end
    end
  end

  def image_url
    if(object.image_blob)
       object.image_blob.service_url
    end
  end
end
