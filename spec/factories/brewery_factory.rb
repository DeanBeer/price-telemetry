require 'factory_girl'

FactoryGirl.define do
  factory :brewery do
    name Faker::Company.name
  end
end

