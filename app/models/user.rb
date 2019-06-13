class User < ApplicationRecord
  has_many :orders
  has_many :tables, through: :orders
  has_secure_password

  def personal_total
    self.orders.map do |order|
      order.price
    end.sum
  end

  def location_of_outstanding_orders
    outstanding_orders = self.orders.select do |order|
      order.served === false
    end

    tables = outstanding_orders.map do |order|
      order.table
    end.uniq
  end
end
