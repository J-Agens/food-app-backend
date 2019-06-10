class TableSerializer < ActiveModel::Serializer
  attributes :id
  has_many :orders
  has_many :users, through: :orders
end
