require 'shared/rails_helper'
require 'shared/specific_controller_responses'

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
      it_behaves_like :post_create_success do
        let(:redirect_url) { brand }
      end
    end

    context 'failure' do
      let(:brand) { mock_model Brand, valid?: false }
      it_behaves_like :post_create_failure do
        let(:ivars) { [ { name: :brand,
                          value: brand } ] }
      end
    end

  end


  describe 'GET edit' do
    before do
      allow(Brand).to receive(:find).and_return(brand)
      get :edit, id: brand.id
    end
    it_behaves_like :get_edit do
      let(:ivars) { [ { name: :brand,
                        value: brand } ] }
    end
  end


  describe 'GET index' do
    let(:brands) { [brand] }

    before do
      allow(Brand).to receive_message_chain(:joins, :order).and_return(brands)
      get :index
    end

    it_behaves_like :get_index do
      let(:ivars) { [ { name: :brands,
                        value: brands
                  } ] }
    end

  end


  describe 'GET new' do
    before do
      get :new, brewery_id: brewery.id
    end

    it_behaves_like :get_new do
      let(:ivar) { :brand }
    end
  end



  describe 'PATCH update' do
    before do
      allow(Brand).to receive(:find).and_return(brand)
      allow(brand).to receive(:update_attributes)
      patch :update, brewery_id: brewery.id, id: brand.id, brand: brand_params
    end

    context 'failure' do
      let(:brand) { mock_model Brand, valid?: false }
      it_behaves_like :patch_update_failure do
        let(:ivars) { [ { name: :brand,
                          value: brand
                    } ] }
      end
    end

    context 'success' do
      let(:brand) { mock_model Brand, valid?: true }
      it_behaves_like :patch_update_success do
        let(:redirect_url) { brand }
      end
    end

  end
end
