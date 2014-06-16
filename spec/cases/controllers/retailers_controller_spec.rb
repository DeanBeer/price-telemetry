require 'shared/rails_helper'
require 'shared/behaves_like_edit'
require 'shared/success_n_failure'

RSpec.describe RetailersController, type: :controller do

  shared_context :edit_context do
    before do
      allow(Retailer).to receive_message_chain(:includes, :find).and_return(retailer)
      allow(Route).to receive_message_chain(:select, :distinct, :map).and_return([])
      allow(retailer).to receive(:route).and_return(route)
    end
  end

  shared_examples_for :edit_retailer do

    it 'sets @route' do
      expect(assigns :route).to be_a(Route)
    end

    it 'sets @routes' do
      expect(assigns :routes).to be_a(Array)
    end

  end


  let(:retailer) { mock_model Retailer, route: route }
  let(:retailer_params) { { name: :llama} }
  let(:route) { mock_model Route }
  let(:route_params) { { name: :blark} }


  describe 'POST create' do
    include_context :edit_context

    before do
      allow(Retailer).to receive(:create).and_return(retailer)
      post :create, retailer: retailer_params, route: route_params
    end

    context 'success' do
      let(:retailer) { mock_model Retailer, valid?: true }
      it_behaves_like :successful_edit do; let(:url) { retailer }; end
    end

    context 'failure' do
      let(:retailer) { mock_model Retailer, valid?: false }
      it_behaves_like :failed_edit do; let(:ivar) { :retailer }; end
      it_behaves_like :edit_retailer
    end

  end


  describe 'GET edit' do
    include_context :edit_context
    before do
      get :edit, id: retailer.id
    end
    it_behaves_like :edit do; let(:ivar) { :retailer }; end
    it_behaves_like :http_success
    it_behaves_like :edit_retailer
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
      get :new
    end
    include_context :edit_context
    it_behaves_like :edit do; let(:ivar) { :retailer }; end
    it_behaves_like :http_success
    it_behaves_like :edit_retailer
  end



  describe 'PATCH update' do
    before do
      allow(Retailer).to receive(:find).and_return(retailer)
      allow(retailer).to receive(:update_attributes)
      patch :update, id: retailer.id, retailer: retailer_params, route: route_params
    end

    context 'failure' do
      let(:retailer) { mock_model Retailer, valid?: false, route: route }
      include_context :edit_context
      it_behaves_like :failed_edit do; let(:ivar) { :retailer }; end
      it_behaves_like :edit_retailer
    end

    context 'success' do
      let(:retailer) { mock_model Retailer, valid?: true }
      it_behaves_like :successful_edit do; let(:url) { retailer }; end
    end

  end
end
