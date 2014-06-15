require 'shared/rails_helper'
require 'shared/behaves_like_edit'
require 'shared/success_n_failure'

RSpec.describe RetailersController, type: :controller do

  let(:retailer) { mock_model Retailer }
  let(:brewery) { mock_model Brewery }
  let(:retailer_params) { { a: :llama} }


  describe 'POST create' do

    before do
      allow(Retailer).to receive(:create).and_return(retailer)
      post :create, brewery_id: brewery.id, retailer: retailer_params
    end

    context 'success' do
      let(:retailer) { mock_model Retailer, valid?: true }
      it_behaves_like :successful_edit do; let(:url) { retailer }; end
    end

    context 'failure' do
      let(:retailer) { mock_model Retailer, valid?: false }
      it_behaves_like :failed_edit do; let(:ivar) { :retailer }; end
    end

  end


  describe 'GET edit' do
    before do
      allow(Retailer).to receive(:find).and_return(retailer)
      get :edit, id: retailer.id
    end
    it_behaves_like :edit do; let(:ivar) { :retailer }; end
    it_behaves_like :http_success
  end


  describe 'GET index' do

    before do
      allow(Retailer).to receive(:order).and_return([retailer])
      get :index
    end

    it 'sets @retailers' do
      expect(assigns :retailers).to_not be_nil
    end

    it { expect(subject).to render_template(:index) }
    it_behaves_like :http_success

  end


  describe 'GET new' do
    before do
      get :new, brewery_id: brewery.id
    end
    it_behaves_like :edit do; let(:ivar) { :retailer }; end
    it_behaves_like :http_success
  end



  describe 'PATCH update' do
    before do
      allow(Retailer).to receive(:find).and_return(retailer)
      allow(retailer).to receive(:update_attributes)
      patch :update, brewery_id: brewery.id, id: retailer.id, retailer: retailer_params
    end

    context 'failure' do
      let(:retailer) { mock_model Retailer, valid?: false }
      it_behaves_like :failed_edit do; let(:ivar) { :retailer }; end
    end

    context 'success' do
      let(:retailer) { mock_model Retailer, valid?: true }
      it_behaves_like :successful_edit do; let(:url) { retailer }; end
    end

  end
end
