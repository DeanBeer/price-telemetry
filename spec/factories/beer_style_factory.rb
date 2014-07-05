require 'factory_girl'

FactoryGirl.define do
  factory :beer_style do
    association :group
    association :member, factory: :brand
    label 'Texas Amber'
  end
end

