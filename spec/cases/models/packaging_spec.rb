require 'shared/rails_helper'

RSpec.describe Packaging, :type => :model do

  it { should have_many :price_data }

  it { should validate_presence_of :quantity }
  it { should validate_presence_of :volume }

  it { should validate_numericality_of(:quantity).only_integer }
  it { should validate_numericality_of(:volume).only_integer }

end
