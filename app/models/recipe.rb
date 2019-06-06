class Recipe < ApplicationRecord
  has_many :cook_sessions
  has_many :orders, through: :cook_sessions
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
end
