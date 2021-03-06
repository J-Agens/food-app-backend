class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :personal_total, :is_done, :wallet
  has_many :orders
  has_many :tables, through: :orders
end
