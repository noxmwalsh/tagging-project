class EntitySerializer < ActiveModel::Serializer
  attributes :category, :identifier

  has_many :tags

end
