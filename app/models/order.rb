class Order < ApplicationRecord
  belongs_to :user
  belongs_to :table
  has_one :cook_session
  validate :same_table

  def customer
    self.user.username
  end

  def same_table
    order_user = User.find_by(id: self.user_id)
    location = order_user.location_of_outstanding_orders
    if self.location.length > 0 && location[0].id != self.table_id
      errors.add(:wrong_table, "You can only have active orders at one table")
    end
  end
end
