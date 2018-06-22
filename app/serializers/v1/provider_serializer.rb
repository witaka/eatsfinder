class V1::ProviderSerializer < ActiveModel::Serializer
  has_many :dishes
  attributes :id, :name, :description, :email, :phone_number, :website, :address


  class DishSerializer < ActiveModel::Serializer
    attributes :id, :name, :dish_type, :description, :price
  end
end
