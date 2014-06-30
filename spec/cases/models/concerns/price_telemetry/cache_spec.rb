require 'shared/rails_helper'

describe PriceTelemetry::Cache do

  let(:subject) { described_class.instance }
  let(:config) { Proc.new { } }

  before do
    subject.configure &config
  end

  it 'caches by default' do
    expect(subject).to be_cacheing
  end


  context 'Cacheing turned on' do
    let(:config) { Proc.new { |c| c[:cacheing] = true } }

  end


  context 'Cache turned off' do
    let(:config) { Proc.new { |c| c[:cacheing] = false } }

    it 'does not cache' do
      expect(subject).to_not be_cacheing
    end

  end

end
