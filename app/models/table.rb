class Table < ApplicationRecord
  has_many :orders
  has_many :users, through: :orders

  def users_at_table
    self.users.map do |user|
      user.username
    end.uniq
  end

  # PROBABLY NEEDS TO BE FIXED
  def active_users_at_table
    self.users.select do |user|
      user.location_of_outstanding_orders.length > 0 && user.location_of_outstanding_orders[0].id == self.id
    end.map do |user|
      user.username
    end.uniq
  end

  def table_total
    self.orders.map do |order|
      order.price
    end.sum
  end
end
