class PermittedParams < Struct.new(:params)

  def brand
    params.require(:brand).permit :name
  end


  def brewery
    params.require(:brewery).permit :name
  end


  def packaging
    params.require(:packaging).permit :name, :quantity, :volume
  end


  def price_datum
    params.require(:price_datum).permit :_destroy,
                                        :date,
                                        :on_special,
                                        :price
  end


  def retailer
    params.require(:retailer).permit :name
  end


  def route
    params.require(:route).permit :name
  end

end
