class PartySerializer < ActiveModel::Serializer
  attributes :id, :name, :table_id
  has_many :orders
  belongs_to :table
end
