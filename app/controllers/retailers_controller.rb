class RetailersController < ApplicationController

  def create
    @retailer = Retailer.create params_for_edit
    if @retailer.valid?
      flash[:success] = 'Good Job'
      redirect_to @retailer
    else
      setup_for_edit
      flash[:error] = 'Boom!'
      render :edit, status: 401
    end
  end


  def edit
    setup_for_edit
    render :edit
  end


  def index
    @retailers = Retailer.all.order :name
  end


  def new
    @retailer = Retailer.new route: Route.new
    edit
  end


  def show
    @retailer = Retailer.find params[:id]
  end


  def update
    @retailer = Retailer.find params[:id]
    @retailer.update_attributes params_for_edit
    if @retailer.valid?
      flash[:success] = 'Good Job'
      redirect_to @retailer
    else
      setup_for_edit
      flash[:error] = 'Boom!'
      render :edit, status: 401
    end
  end

private

  def params_for_edit
    permitted_params.retailer.merge route: route
  end


  def route
    Route.find_or_create_by permitted_params.route
  end


  def setup_for_edit
    @retailer ||= Retailer.includes(:route).find params[:id]
    @route ||= @retailer.route || Route.new
    @routes ||= Route.select(:name).distinct.map(&:name)
  end

end

