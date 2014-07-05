require 'shared/rails_helper'
require 'shared/working_in_the_factory'


RSpec.describe Brand, type: :model do

  it_behaves_like :working_in_the_factory do
    let(:subject) { FactoryGirl.build :brand }
  end

  it 'includes PriceTelemetry::GroupMember' do
    expect( described_class.include?(PriceTelemetry::GroupMember) )
  end
  it 'includes PriceTelemetry::PrettyParam' do
    expect( described_class.include?(PriceTelemetry::PrettyParam) )
  end

  it { should belong_to :brewery }

  it { should accept_nested_attributes_for :brewery }

  it { should have_many :price_data }

  it { should validate_presence_of :name }
  it { should validate_presence_of :brewery }

  it { should validate_uniqueness_of(:name).scoped_to(:brewery_id) }

end
