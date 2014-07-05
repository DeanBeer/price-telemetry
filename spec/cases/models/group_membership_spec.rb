require 'shared/rails_helper'

RSpec.describe GroupMembership, :type => :model do

  it { should belong_to :group }
  it { should belong_to :member }

  it { should ensure_length_of(:label).is_at_most(40) }

  it { should validate_presence_of :group }
  it { should validate_presence_of :member }

end
