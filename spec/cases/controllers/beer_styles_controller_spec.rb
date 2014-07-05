require 'shared/rails_helper'
require 'shared/basic_controller_responses'

RSpec.describe BeerStylesController, type: :controller do

  let(:beer_style) { mock_model BeerStyle }

  describe 'POST create' do

    let(:beer_style_params) { { beer_style: { name: Faker::Commerce.product_name } } }
 
    before do
      allow(BeerStyle).to receive(:create).and_return(beer_style)
      post :create, beer_style: beer_style_params
    end

    context 'success' do
      let(:beer_style) { mock_model BeerStyle, valid?: true }
      it_behaves_like :flashy_success_redirect do
        let(:redirect_url) { beer_styles_url }
      end
    end

    context 'failure' do
#      let(:beer_style) { mock_model BeerStyle, valid?: false }
#      it_behaves_like :failed_edit do; let(:ivar) { :beer_style }; end
    end

  end


  describe 'GET index' do

    before do
      get :index
    end

    it_behaves_like :unflashy_render do
      let(:ivars) { [ { name: :beer_styles } ] }
      let(:template) { :index }
    end

  end


  describe 'GET show' do
    before do
      allow(BeerStyle).to receive(:find).and_return(beer_style)
      get :show, id: beer_style
    end

    it_behaves_like :unflashy_render do
      let(:ivars) { [
                      { name: :beer_style, value: beer_style },
                      { name: :brands },
                      { name: :members }
                  ] }
      let(:template) { :show }
    end

  end

end
