class TableSerializer < ActiveModel::Serializer
  attributes :id, :users_at_table, :table_total
  has_many :orders
  has_many :users, through: :orders
end
