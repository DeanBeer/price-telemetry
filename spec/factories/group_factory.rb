require 'factory_girl'

FactoryGirl.define do
  factory :group do
    name Faker::Commerce.color
  end
end

