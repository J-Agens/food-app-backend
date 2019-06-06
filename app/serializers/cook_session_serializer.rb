class CookSessionSerializer < ActiveModel::Serializer
  attributes :id, :recipe_id, :order_id, :pot_id
end
