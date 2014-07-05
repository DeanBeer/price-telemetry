require 'shared/rails_helper'
require 'shared/specific_controller_responses'

RSpec.describe RoutesController, type: :controller do

  let(:route) { mock_model Route }
  let(:route_params) { { a: :llama} }


  describe 'POST create' do

    before do
      allow(Route).to receive(:create).and_return(route)
      post :create, route: route_params
    end

    context 'success' do
      let(:route) { mock_model Route, valid?: true }
      it_behaves_like :post_create_success do; let(:redirect_url) { route }; end
    end

    context 'failure' do
      let(:route) { mock_model Route, valid?: false }
      it_behaves_like :post_create_failure do
        let(:ivars) { [ { name: :route, value: route } ] }
      end
    end

  end


  describe 'GET edit' do
    before do
      allow(Route).to receive(:find).and_return(route)
      get :edit, id: route.id
    end
    it_behaves_like :get_edit do
      let(:ivars) { [ { name: :route, value: route } ] }
    end
  end


  describe 'GET index' do

    let(:routes) { [route] }

    before do
      allow(Route).to receive_message_chain(:all,:order).and_return(routes)
      get :index
    end
    it_behaves_like :get_index do
      let(:ivars) { [ { name: :routes, value: routes } ] }
    end

  end


  describe 'GET new' do
    before do
      get :new
    end
    it_behaves_like :get_new do; let(:ivar) { :route }; end
  end



  describe 'PATCH update' do
    before do
      allow(Route).to receive(:find).and_return(route)
      allow(route).to receive(:update_attributes)
      patch :update, id: route.id, route: route_params
    end

    context 'failure' do
      let(:route) { mock_model Route, valid?: false }
      it_behaves_like :patch_update_failure do
        let(:ivars) { [ { name: :route, value: route } ] }
      end
    end

    context 'success' do
      let(:route) { mock_model Route, valid?: true }
      it_behaves_like :patch_update_success do; let(:redirect_url) { route }; end
    end

  end
end
