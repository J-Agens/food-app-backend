class CookSession < ApplicationRecord
  belongs_to :recipe
  belongs_to :order
  belongs_to :pot
end
