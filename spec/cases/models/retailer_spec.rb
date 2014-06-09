require 'shared/rails_helper'

RSpec.describe Retailer, :type => :model do

  it { should have_many :price_data }

  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }

end
