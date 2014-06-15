class PriceDataController < ApplicationController

  def create
    @price_datum = PriceDatum.create params_for_create
    if @price_datum.valid?
      redirect_to new_price_datum_url date: @price_datum.date,
                                      retailer: { name: @price_datum.retailer_name }
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
    @breweries = Brewery.select(:name).distinct.map(&:name)
    @packagings = Packaging.select(:name).distinct.map(&:name)
    @retailers = Retailer.select(:name).distinct.map(&:name)
    @price_datum ||= PriceDatum.new params_for_new
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
    return unless params[:brand]
    @brand ||= brewery.brands.find_or_create_by(permitted_params.brand)
  end


  def brewery
    @brewery ||= find_or_create_model(:brewery)
  end


  def packaging
    @packaging ||= params.fetch(:packaging,false) ? Packaging.where(name: permitted_params.packaging[:name]).first : nil
  end


  def params_for_create
    permitted_params.price_datum.merge params_for_merge
  end


  def params_for_merge
    { brand: brand,
      packaging: packaging,
      retailer: retailer
    }
  end


  def params_for_new
    permitted_params.new_price_datum.merge params_for_merge
  end


  def retailer
    @retailer ||= find_or_create_model(:retailer)
  end


  def find_or_create_model(model)
    return unless params[model]
    model.to_s.classify.constantize.find_or_create_by permitted_params.send(model)
  end

end
