require 'shared/rails_helper'

describe Route do

  it { should have_many :retailers }
  it { should validate_presence_of(:name) }

end
