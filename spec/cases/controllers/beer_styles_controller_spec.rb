require 'shared/rails_helper'
require 'shared/specific_controller_responses'

RSpec.describe BeerStylesController, type: :controller do

  let(:beer_style) { mock_model BeerStyle }

  describe 'GET index' do
    let(:beer_styles) { [ :ale, :beer, :lager ] }

    before do
      allow(BeerStyle).to receive(:all_styles).and_return(beer_styles)
      get :index
    end
    it_behaves_like :get_index do
      let(:ivars) { [ { name: :beer_styles, value: beer_styles } ] }
    end
  end


  describe 'GET show' do
    before do
      allow(BeerStyle).to receive(:find).and_return(beer_style)
      get :show, id: beer_style
    end
    it_behaves_like :get_show do
      let(:ivars) { [
                      { name: :beer_style, value: beer_style },
                      { name: :brands },
                      { name: :members }
                  ] }
    end

  end

end
