class OrderSerializer < ActiveModel::Serializer
  attributes :id, :item_name, :user_id, :served, :price, :table_id, :customer, :canceled
  belongs_to :user
  belongs_to :table
  has_one :cook_session
end
