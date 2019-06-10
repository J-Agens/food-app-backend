class CookSessionSerializer < ActiveModel::Serializer
  attributes :id, :recipe_id, :recipe_name, :required_ingredients, :customer_name, :order_id, :pot_id
end
