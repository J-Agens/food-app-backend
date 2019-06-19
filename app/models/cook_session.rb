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

  # def unique_order
  #   order_ids = CookSession.all.map do |cs|
  #     cs.order_id
  #   end
  #
  #   if order_ids.include(self.order_id)
  #     errors.add(:order_being_cooked, "Only one cook session per order.")
  #   end
  # end
end
