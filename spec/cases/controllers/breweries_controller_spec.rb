require 'shared/rails_helper'
require 'shared/specific_controller_responses'

RSpec.describe BreweriesController, type: :controller do

  let(:brewery) { mock_model Brewery }
  let(:brewery_params) { { a: :llama} }


  describe 'POST create' do

    before do
      allow(Brewery).to receive(:create).and_return(brewery)
      post :create, brewery: brewery_params
    end

    context 'success' do
      let(:brewery) { mock_model Brewery, valid?: true }
      it_behaves_like :post_create_success do
        let(:redirect_url) { brewery }
      end
    end

    context 'failure' do
      let(:brewery) { mock_model Brewery, valid?: false }
      it_behaves_like :post_create_failure do
        let(:template) { :edit }
      end
    end

  end


  describe 'GET edit' do
    before do
      allow(Brewery).to receive(:find).and_return(brewery)
      get :edit, id: brewery.id
    end
    it_behaves_like :get_edit do
      let(:ivars) { [ { name: :brewery,
                        value: brewery } ] }
    end
  end


  describe 'GET index' do
    let(:breweries) { [brewery] }

    before do
      allow(Brewery).to receive(:order).and_return(breweries)
      get :index
    end

    it_behaves_like :get_index do
      let(:ivars) { [ { name: :breweries,
                        value: breweries
                  } ] }
    end

  end


  describe 'GET new' do
    before do
      get :new
    end
    it_behaves_like :get_new do
      let(:ivar) { :brewery }
    end
  end



  describe 'PATCH update' do
    before do
      allow(Brewery).to receive(:find).and_return(brewery)
      allow(brewery).to receive(:update_attributes)
      patch :update, id: brewery.id, brewery: brewery_params
    end

    context 'failure' do
      let(:brewery) { mock_model Brewery, valid?: false }
      it_behaves_like :patch_update_failure do
        let(:ivars) { [ { name: :brewery,
                          value: brewery
                    } ] }
      end
    end

    context 'success' do
      let(:brewery) { mock_model Brewery, valid?: true }
      it_behaves_like :patch_update_success do
        let(:redirect_url) { brewery }
      end
    end

  end
end
