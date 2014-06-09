require 'shared/rails_helper'

RSpec.describe Brewery, type: :model do

  it { should have_many :brands }

  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }

end
