class PermittedParams < Struct.new(:tainted_params)

  def brand
    tainted_params.require(:brand).permit :name
  end


  def brewery
    tainted_params.require(:brewery).permit :name
  end


  def new_price_datum
    tainted_params.permit :date, { retailer: [:name] }
  end


  def packaging
    tainted_params.require(:packaging).permit :name
  end


  def price_datum
    tainted_params.require(:price_datum).permit :_destroy,
                                                :date,
                                                :on_special,
                                                :price
  end


  def retailer
    tainted_params.require(:retailer).permit :name
  end


  def route
    tainted_params.require(:route).permit :name
  end

end
