class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :personal_total
  has_many :orders
  has_many :tables, through: :orders
end
