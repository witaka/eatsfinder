class Api::V1::ProviderSerializer < ActiveModel::Serializer
  has_many :dishes
  attributes :id, :name, :description
end
