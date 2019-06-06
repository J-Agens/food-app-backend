class Order < ApplicationRecord
  belongs_to :party
  belongs_to :recipe
  has_one :cook_session
end
