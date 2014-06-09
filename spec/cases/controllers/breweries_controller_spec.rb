require 'shared/rails_helper'
require 'shared/behaves_like_edit'
require 'shared/success_n_failure'

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
      it_behaves_like :successful_edit do; let(:url) { brewery }; end
    end

    context 'failure' do
      let(:brewery) { mock_model Brewery, valid?: false }
      it_behaves_like :failed_edit do; let(:ivar) { :brewery }; end
    end

  end


  describe 'GET edit' do
    before do
      allow(Brewery).to receive(:find).and_return(brewery)
      get :edit, id: brewery.id
    end
    it_behaves_like :edit do; let(:ivar) { :brewery }; end
    it_behaves_like :http_success
  end


  describe 'GET index' do

    before do
      allow(Brewery).to receive(:order).and_return([brewery])
      get :index
    end

    it 'sets @breweries' do
      expect(assigns :breweries).to_not be_nil
    end

    it { expect(subject).to render_template(:index) }
    it_behaves_like :http_success

  end


  describe 'GET new' do
    before do
      get :new
    end
    it_behaves_like :edit do; let(:ivar) { :brewery }; end
    it_behaves_like :http_success
  end



  describe 'PATCH update' do
    before do
      allow(Brewery).to receive(:find).and_return(brewery)
      allow(brewery).to receive(:update_attributes)
      patch :update, id: brewery.id, brewery: brewery_params
    end

    context 'failure' do
      let(:brewery) { mock_model Brewery, valid?: false }
      it_behaves_like :failed_edit do; let(:ivar) { :brewery }; end
    end

    context 'success' do
      let(:brewery) { mock_model Brewery, valid?: true }
      it_behaves_like :successful_edit do; let(:url) { brewery }; end
    end

  end
end
