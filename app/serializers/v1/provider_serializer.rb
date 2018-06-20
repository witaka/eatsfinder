class V1::ProviderSerializer < ActiveModel::Serializer
  has_many :dishes
  attributes :id, :name, :description, :email, :phone_number, :website, :address
end
