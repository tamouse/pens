require 'faker'

FactoryBot.define do
  factory :address, class: Address do
    label { "fake" }
    active { true }
    address_1 { Faker::Address.street_address }
    locality { Faker::Address.city }
    region_code { Faker::Address.state_abbr }
    country_code { "US" }
    postal_code { Faker::Address.zip }
  end
end
