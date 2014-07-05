require 'shared/rails_helper'
require 'shared/working_in_the_factory'

RSpec.describe Brewery, type: :model do

  it_behaves_like :working_in_the_factory do
    let(:subject) { FactoryGirl.build :brewery }
  end

  it { should have_many :brands }

  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }

end
