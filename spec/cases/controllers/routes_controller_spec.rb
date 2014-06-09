require 'shared/rails_helper'
require 'shared/behaves_like_edit'
require 'shared/success_n_failure'

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
      it_behaves_like :successful_edit do; let(:url) { route }; end
    end

    context 'failure' do
      let(:route) { mock_model Route, valid?: false }
      it_behaves_like :failed_edit do; let(:ivar) { :route }; end
    end

  end


  describe 'GET edit' do
    before do
      allow(Route).to receive(:find).and_return(route)
      get :edit, id: route.id
    end
    it_behaves_like :edit do; let(:ivar) { :route }; end
    it_behaves_like :http_success
  end


  describe 'GET index' do

    before do
      allow(Route).to receive(:order).and_return([route])
      get :index
    end

    it 'sets @routes' do
      expect(assigns :routes).to_not be_nil
    end

    it { expect(subject).to render_template(:index) }
    it_behaves_like :http_success

  end


  describe 'GET new' do
    before do
      get :new
    end
    it_behaves_like :edit do; let(:ivar) { :route }; end
    it_behaves_like :http_success
  end



  describe 'PATCH update' do
    before do
      allow(Route).to receive(:find).and_return(route)
      allow(route).to receive(:update_attributes)
      patch :update, id: route.id, route: route_params
    end

    context 'failure' do
      let(:route) { mock_model Route, valid?: false }
      it_behaves_like :failed_edit do; let(:ivar) { :route }; end
    end

    context 'success' do
      let(:route) { mock_model Route, valid?: true }
      it_behaves_like :successful_edit do; let(:url) { route }; end
    end

  end
end
