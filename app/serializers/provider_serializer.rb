class ProviderSerializer < ActiveModel::Serializer

  has_many :dishes
  attributes :id, :name

end
