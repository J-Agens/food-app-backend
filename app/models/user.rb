class User < ApplicationRecord
  has_many :orders
  has_many :tables, through: :orders
  has_secure_password

  def personal_total
    self.orders.map do |order|
      order.price
    end.sum
  end

end
