require 'shared/rails_helper'
require 'shared/behaves_like_edit'
require 'shared/success_n_failure'

RSpec.describe BrandsController, type: :controller do

  let(:brand) { mock_model Brand }
  let(:brewery) { mock_model Brewery }
  let(:brand_params) { { a: :llama} }


  describe 'POST create' do

    before do
      allow(Brand).to receive(:create).and_return(brand)
      post :create, brewery_id: brewery.id, brand: brand_params
    end

    context 'success' do
      let(:brand) { mock_model Brand, valid?: true }
      it_behaves_like :successful_edit do; let(:url) { brand }; end
    end

    context 'failure' do
      let(:brand) { mock_model Brand, valid?: false }
      it_behaves_like :failed_edit do; let(:ivar) { :brand }; end
    end

  end


  describe 'GET edit' do
    before do
      allow(Brand).to receive(:find).and_return(brand)
      get :edit, id: brand.id
    end
    it_behaves_like :edit do; let(:ivar) { :brand }; end
    it_behaves_like :http_success
  end


  describe 'GET index' do

    before do
      allow(Brand).to receive(:order).and_return([brand])
      get :index
    end

    it 'sets @brands' do
      expect(assigns :brands).to_not be_nil
    end

    it { expect(subject).to render_template(:index) }
    it_behaves_like :http_success

  end


  describe 'GET new' do
    before do
      get :new, brewery_id: brewery.id
    end
    it_behaves_like :edit do; let(:ivar) { :brand }; end
    it_behaves_like :http_success
  end



  describe 'PATCH update' do
    before do
      allow(Brand).to receive(:find).and_return(brand)
      allow(brand).to receive(:update_attributes)
      patch :update, brewery_id: brewery.id, id: brand.id, brand: brand_params
    end

    context 'failure' do
      let(:brand) { mock_model Brand, valid?: false }
      it_behaves_like :failed_edit do; let(:ivar) { :brand }; end
    end

    context 'success' do
      let(:brand) { mock_model Brand, valid?: true }
      it_behaves_like :successful_edit do; let(:url) { brand }; end
    end

  end
end
