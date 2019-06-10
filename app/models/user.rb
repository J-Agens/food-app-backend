class User < ApplicationRecord
  has_many :orders
  has_many :tables, through: :orders
end
