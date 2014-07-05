require 'shared/rails_helper'
require 'shared/working_in_the_factory'

RSpec.describe Group, :type => :model do

  it_behaves_like :working_in_the_factory do
    let(:subject) { FactoryGirl.build :group }
  end

  it { should ensure_length_of(:name).is_at_most(40) }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }

  it { should have_many :group_memberships }

  it { should have_many(:brands).through(:group_memberships) }
  it { should have_many(:retailers).through(:group_memberships) }

  context 'the beer style group' do
    let(:subject) { Group.beer_style }
    it { expect(subject).to be_a(Group) }
    it { expect(subject.name).to eq :beer_style }
  end

  context 'the retailer class group' do
    let(:subject) { Group.retailer_class }
    it { expect(subject).to be_a(Group) }
    it { expect(subject.name).to eq :retailer_class }
  end

end
