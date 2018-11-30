class Vendor < ApplicationRecord

  has_many :addresses, as: :addressable

end
