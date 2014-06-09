require 'shared/rails_helper'

RSpec.describe PriceDataController, type: :controller do

  let(:price_datum) { mock_model(PriceDatum, id: 1) }

  context 'PUT create' do
    it 'make some create examples'
  end

  context 'DELETE destroy' do

    shared_examples_for :destroying do
      it 'redirects' do
        expect(subject).to redirect_to(price_data_url)
      end
    end

    before do
      allow(PriceDatum).to receive(:find).and_return(price_datum)
      delete :destroy, id: price_datum.id, retailer: {llama: :blark}
    end

    context 'failure' do
      let(:price_datum) { mock_model(PriceDatum, destroyed?: false, id: 1) }

      it { expect(flash[:error]).to_not be_blank }
      it_behaves_like :destroying

    end


    context 'success' do

      let(:price_datum) { mock_model(PriceDatum, destroyed?: true, id: 1) }

      it_behaves_like :destroying

    end

  end


  context 'GET index' do

    before do
      get :index
    end

    it 'sets @price_data' do
      expect(assigns :price_data).to_not be_nil
    end

    it { should render_template(:index) }

  end


  context 'GET new' do

    before do
      get :new
    end

    it 'assigns @price_datum' do
      expect(assigns :price_datum).to be_a_new(PriceDatum)
    end

    it 'assigns @brands' do
      expect(assigns :brands).to_not be_nil
    end

    it 'assigns @breweries' do
      expect(assigns :breweries).to be_a(Array)
    end

    it 'assigns @retailers' do
      expect(assigns :retailers).to be_an(Array)
    end

    it { should render_template(:new) }

  end


  context 'GET show' do

    before do
      allow(PriceDatum).to receive(:find).and_return(price_datum)
      get :show, id: price_datum.id
    end

    it 'sets @price_datum' do
      expect(assigns :price_datum).to_not be_nil
    end

    it { should render_template(:show) }

  end


end
