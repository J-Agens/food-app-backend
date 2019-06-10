class PotSerializer < ActiveModel::Serializer
  attributes :id
  has_one :cook_session
end
