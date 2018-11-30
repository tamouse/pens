require 'faker'

FactoryBot.define do
  factory :manufacturer do
    name { Faker::Company.name }
    active { true }
    factory :manufacturer_with_address do
      after(:create) do |mfr|
        create(:address, addressable: mfr)
      end
    end
  end
end
