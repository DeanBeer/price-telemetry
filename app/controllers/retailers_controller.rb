class RetailersController < ApplicationController

  def create
    @retailer = Retailer.create permitted_params.retailer
    if @retailer.valid?
      flash[:success] = 'Good Job'
      redirect_to @retailer
    else
      flash[:error] = 'Boom!'
      render :edit, status: 401
    end
  end


  def edit
    @retailer = Retailer.find params[:id]
  end


  def index
    @retailers = Retailer.all
  end


  def new
    @retailer = Retailer.new
    render :edit
  end


  def show
    @retailer = Retailer.find params[:id]
  end


  def update
    @retailer = Retailer.find params[:id]
    @retailer.update_attributes permitted_params.retailer
    if @retailer.valid?
      flash[:success] = 'Good Job'
      redirect_to @retailer
    else
      flash[:error] = 'Boom!'
      render :edit, status: 401
    end
  end

end

