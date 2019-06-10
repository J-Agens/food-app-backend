class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_many :orders
  has_many :tables, through: :orders
end
