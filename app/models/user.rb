class User < ApplicationRecord
  has_many :orders
  has_many :tables, through: :orders
  has_secure_password
end
