require 'shared/rails_helper'
require 'shared/working_in_the_factory'

describe BeerStyle, type: :model do

  it_behaves_like :working_in_the_factory do
    let(:subject) { FactoryGirl.build :beer_style }
  end

  it { expect(BeerStyle).to be < GroupMembership }

  describe 'find_by_name_or_id' do

    let(:beer_style) { FactoryGirl.create :beer_style }
    let(:id) { beer_style.id }
    let(:id_string) { beer_style.id.to_s }
    let(:name) { beer_style.label }

    it 'finds by name' do
      expect(described_class.find_by_name_or_id name).to eq(beer_style)
    end

    it 'finds by id' do
      expect(described_class.find_by_name_or_id id).to eq(beer_style)
    end

    it 'finds by a string id' do
      expect(described_class.find_by_name_or_id id_string).to eq(beer_style)
    end

  end

end
