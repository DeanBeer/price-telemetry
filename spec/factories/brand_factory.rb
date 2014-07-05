require 'factory_girl'

FactoryGirl.define do
  factory :brand do
    association :brewery
    name Faker::Commerce.product_name
  end
end

