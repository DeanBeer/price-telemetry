require 'shared/rails_helper'

RSpec.describe Brand, type: :model do

  it { should belong_to :brewery }

  it { should accept_nested_attributes_for :brewery }

  it { should have_many :price_data }

  it { should validate_presence_of :name }
  it { should validate_presence_of :brewery }

  it { should validate_uniqueness_of(:name).scoped_to(:brewery_id) }

end
