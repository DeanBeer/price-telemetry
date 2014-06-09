class PriceDataController < ApplicationController

  def create
    @price_datum = PriceDatum.create permitted_params.price_datum.merge(brand: brand, packaging: packaging, retailer: retailer)

    if @price_datum.valid?
      redirect_to new_price_datum_url
    else
      new
    end
  end


  def destroy
    price_datum = PriceDatum.find params[:id]
    price_datum.destroy
    unless price_datum.destroyed?
      flash[:error] = 'Failed to destroy datum'
    end
    redirect_to price_data_url
  end


  def new
    @brands = Brand.includes(:brewery).map { |brand| { name: brand.name, brewery: brand.brewery_name } }
    @breweries = Brewery.all.map(&:name)
    @retailers = Retailer.all.map(&:name)
    @price_datum ||= PriceDatum.new
    render :new
  end


  def index
    @price_data = PriceDatum.all
  end


  def show
    @price_datum = PriceDatum.find params[:id]
  end

private

  def brand
    brewery.brands.find_or_create_by permitted_params.brand
  end


  def brewery
    Brewery.find_or_create_by permitted_params.brewery
  end


  def packaging
    Packaging.find_or_create_by permitted_params.packaging
  end


  def retailer
    Retailer.find_or_create_by permitted_params.retailer
  end

end
