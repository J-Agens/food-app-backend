class TableSerializer < ActiveModel::Serializer
  attributes :id
  has_one :party
end
