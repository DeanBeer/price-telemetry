require 'shared/rails_helper'

RSpec.describe Packaging, :type => :model do

  it { should have_many :price_data }

  it { should validate_numericality_of(:quantity).only_integer }

  it { should validate_presence_of :material }
  it { should validate_presence_of :quantity }
  it { should validate_presence_of :volume_scalar }
  it { should validate_presence_of :volume_units }

  it { should validate_uniqueness_of :name }


  describe :naming do
    let(:name) { '350 mililiter' }
    let(:quantity) { 1 }
    let(:volume) { Unit.new volume_name }
    let(:volume_name) { '350 ml' }

    context 'with no name' do
      let(:packaging) { Packaging.new quantity: quantity, volume: volume }
      it 'should return quantity by volume' do
        expect(packaging.name).to eq("#{quantity} x #{volume}")
      end
    end

    context 'with a name' do
      let(:packaging) { Packaging.new name: name, quantity: quantity, volume: volume }
      it 'should return quantity by volume' do
        expect(packaging.name).to eq(name)
      end
    end

  end

end
