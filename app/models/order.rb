class Order < ApplicationRecord
  belongs_to :user
  belongs_to :table
  has_one :cook_session
  validate :same_table
  validate :room_at_table
  validate :order_max
  validate :enough_money

  def customer
    self.user.username
  end

  def same_table
    order_user = User.find_by(id: self.user_id)

    location = order_user.location_of_outstanding_orders
    if location.length > 0 && location[0].id != self.table_id
      errors.add(:wrong_table, "You can only have active orders at one table")
    end
  end

  def room_at_table
    table = Table.find_by(id: self.table_id)
    user = User.find_by(id: self.user_id)
    if table.active_users_at_table.length >= 4 && !table.active_users_at_table.include?(user.username)
      errors.add(:table_full, "This table is full. Only four users per table.")
    end
  end

  # THIS VALIDATION WAS PREVENTING ORDERS FROM BEING UPDATED. --> ok for now
  def order_max
    table = Table.find_by(id: self.table_id)

    placed_orders = table.orders.select do |order|
      order.served == false
    end

    served_orders = table.orders.select do |order|
      order.served
    end

    if placed_orders.length >= 10 || served_orders.length >= 10
      errors.add(:too_many_orders, "Table order limit reached.")
    end
  end

  # NOT CURRENTLY IMPLEMENTED
  def enough_money
    user = User.find_by(id: self.user_id)
    if user.wallet < self.price
      errors.add(:not_enough_money, "You don't have enough money in your wallet.")
    end
  end
end
