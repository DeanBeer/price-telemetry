require 'shared/rails_helper'
require 'shared/specific_controller_responses'

RSpec.describe PriceDataController, type: :controller do

  shared_context :new_price_datum_context do
    before do
      allow(Brand).to receive_message_chain(:includes,:map)
      [ Brewery, Packaging, Retailer ].each do |c|
        allow(c).to receive_message_chain(:select, :distinct, :map)
      end
    end
  end


  let(:brand_name) { 'Bellows Texas Amber' }
  let(:brand_params) { { name: brand_name } }
  let(:brewery_name) { 'Midnight Hour Brewers' }
  let(:brewery_params) { { name: brewery_name } }
  let(:date) { Date.today }
  let(:packaging_params) { { quantity: 1, volume: 1 } }
  let(:params_for_new) { { brand: brand_params,
                           brewery: brewery_params,
                           date: date,
                           packaging: packaging_params,
                           price_datum: price_datum_params,
                           retailer: retailer_params
                       } }
  let(:price_datum) { mock_model PriceDatum, id: 1 }
  let(:price_datum_params) { { brand_id: 1,
                               brewery_id: 1,
                               date: Date.today,
                               retailer_id: 1,
                               packaging_id: 1,
                               price_cents: 100
                           } }
  let(:retailer_name) { 'Pussy Lips' }
  let(:retailer_params) { { name: retailer_name } }


  context 'POST create' do
    before do
      allow(PriceDatum).to receive(:create).and_return(price_datum)
      put :create, params_for_new
    end

    context 'failure' do
      let(:price_datum) { mock_model PriceDatum, valid?: false }
      include_context :new_price_datum_context
      it_behaves_like :post_create_failure do
        let(:ivars) { [ { name: :price_datum,
                          value: price_datum
                    } ] }
      end
    end

    context 'success' do
      let(:price_datum) { mock_model PriceDatum, retailer_name: retailer_name, valid?: true }
       it_behaves_like :post_create_success do
        let(:redirect_url) { new_price_datum_url(date: price_datum.date, retailer: { name: price_datum.retailer_name }) }
       end
    end

  end


  context 'DELETE destroy' do

    before do
      allow(PriceDatum).to receive(:find).and_return(price_datum)
      delete :destroy, id: price_datum.id, retailer: {llama: :blark}
    end

    context 'failure' do
      let(:price_datum) { mock_model(PriceDatum, destroyed?: false, id: 1) }
      it_behaves_like :delete_destroy_failure do
        let(:redirect_url) { price_data_url }
      end
    end


    context 'success' do
      let(:price_datum) { mock_model PriceDatum, destroyed?: true }
      it_behaves_like :delete_destroy_success do
        let(:redirect_url) { price_data_url }
      end
    end

  end


  context 'GET index' do

    before do
      get :index
    end
    it_behaves_like :get_index do
      let(:ivar) { :price_data }
    end
  end


  context 'GET new' do

    before do
      get :new, params_for_new
    end

    include_context :new_price_datum_context

    it_behaves_like :get_new do
      let(:ivars) { [ :brands, :breweries, :packagings, :retailers, :price_datum ] }
    end

    it 'assigns a date to price_datum' do
      expect(assigns(:price_datum).date).to_not be_blank
    end

    it 'instantiates a new price_datum with date' do
      expect(assigns(:price_datum).date).to eq(date)
    end

    it 'assigns a brewery name to price_datum' do
      expect(assigns(:price_datum).brewery_name).to_not be_blank
    end

    it 'instantiates a new price_datum with brewery_name' do
      expect(assigns(:price_datum).brewery_name).to eq(brewery_name)
    end

    it 'assigns a retailer to price_datum' do
      expect(assigns(:price_datum).retailer_name).to_not be_blank
    end

    it 'instantiates a new price_datum with retailer_name' do
      expect(assigns(:price_datum).retailer_name).to eq(retailer_name)
    end

  end


  context 'GET show' do

    before do
      allow(PriceDatum).to receive(:find).and_return(price_datum)
      get :show, id: price_datum.id
    end
    it_behaves_like :get_show do
      let(:ivars) { [ { name: :price_datum,
                        value: price_datum
                  } ] }
    end
  end


end
