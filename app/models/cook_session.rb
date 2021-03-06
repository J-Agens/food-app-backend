class CookSession < ApplicationRecord
  belongs_to :recipe
  belongs_to :order
  belongs_to :pot
  validates :order_id, uniqueness: true, allow_nil: true

  def recipe_name
    self.recipe.name
  end

  def customer_name
    self.order.user.username
  end

  def required_ingredients
    self.recipe.ingredients.map do |ing|
      ing.name
    end
  end

end
