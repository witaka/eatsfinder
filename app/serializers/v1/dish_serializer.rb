class V1::DishSerializer < ActiveModel::Serializer
 attributes :id, :name, :dish_type, :description, :price
end
