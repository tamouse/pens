class Pen < ApplicationRecord
  belongs_to :manufacturer
  belongs_to :vendor
  has_many :inkings
end
