class Order < ApplicationRecord
  belongs_to :user
  belongs_to :table
  has_one :cook_session

  def customer
    self.user.username
  end
end
