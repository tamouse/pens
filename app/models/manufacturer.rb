class Manufacturer < ApplicationRecord
  has_many :addresses, as: :addressable
end
