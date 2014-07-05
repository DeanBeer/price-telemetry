require 'shared/rails_helper'
require 'shared/specific_controller_responses'

RSpec.describe RetailersController, type: :controller do

  shared_context :edit_context do
    before do
      allow(Retailer).to receive_message_chain(:includes, :find).and_return(retailer)
      allow(Route).to receive_message_chain(:select, :distinct, :map).and_return([])
      allow(retailer).to receive(:route).and_return(route)
    end

    let(:ivars) { [ { name: :retailer },
                    { name: :route },
                    { name: :routes }
                ] }
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

    context 'failure' do

      include_context :edit_context

      let(:retailer) { mock_model Retailer, valid?: false }

      it_behaves_like :post_create_failure do
        let(:redirect_url) { retailer }
      end
    end


    context 'success' do
      let(:retailer) { mock_model Retailer, valid?: true }
      it_behaves_like :post_create_success do
        let(:redirect_url) { retailer }
      end
    end
  end


  describe 'GET edit' do
    include_context :edit_context
    before do
      get :edit, id: retailer.id
    end
    it_behaves_like :get_edit
  end


  describe 'GET index' do
    let(:retailers) { [retailer] }
    before do
      allow(Retailer).to receive_message_chain(:all, :order).and_return(retailers)
      get :index
    end
    it_behaves_like :get_index do
      let(:ivars) { [ { name: :retailers, value: retailers } ] }
    end
  end


  describe 'GET new' do
    include_context :edit_context

    before do
      get :new
    end

    it_behaves_like :get_edit
  end



  describe 'PATCH update' do
    before do
      allow(Retailer).to receive(:find).and_return(retailer)
      allow(retailer).to receive(:update_attributes)
      patch :update, id: retailer.id, retailer: retailer_params, route: route_params
    end

    context 'failure' do
      include_context :edit_context

      let(:retailer) { mock_model Retailer, valid?: false, route: route }

      it_behaves_like :patch_update_failure
    end

    context 'success' do
      let(:retailer) { mock_model Retailer, valid?: true }
      it_behaves_like :patch_update_success do
        let(:redirect_url) { retailer }
      end
    end

  end
end
