class Table < ApplicationRecord
  has_many :orders
  has_many :users, through: :orders

  def users_at_table
    self.users.map do |user|
      user.username
    end.uniq
  end

  def table_total
    self.orders.map do |order|
      order.price
    end.sum
  end
end
