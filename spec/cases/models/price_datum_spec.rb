require 'shared/rails_helper'
require "money-rails/test_helpers"

RSpec.describe PriceDatum, :type => :model do
  include MoneyRails::TestHelpers

  it { should belong_to :brand }
  it { should belong_to :retailer }
  it { should belong_to :packaging }

  it { should validate_presence_of :date }
  it { should validate_presence_of :retailer }
  it { should validate_presence_of :packaging }
  it { should validate_presence_of :price_cents }

  it { should ensure_inclusion_of(:on_special).in_array([false,true]) }

  it { should validate_numericality_of(:price_cents).is_greater_than(0) }

  it { expect(described_class.new).not_to be_on_special }

  it 'monetizes :price' do
    expect(monetize :price_cents).to be_true
  end

  it 'starts with a default date' do
    expect(described_class.new.date).to eq(Date.today)
  end

  it 'starts with a default on_special' do
    expect(described_class.new.on_special).to_not be_nil
  end

end
