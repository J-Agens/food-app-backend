class OrderSerializer < ActiveModel::Serializer
  attributes :id, :item_name, :party_id, :served, :price, :recipe_id

  belongs_to :party
  belongs_to :recipe
  has_one :cook_session
end
