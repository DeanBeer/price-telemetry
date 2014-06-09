class BreweriesController < ApplicationController

  def create
    @brewery = Brewery.create permitted_params.brewery
    if @brewery.valid?
      flash[:success] = 'Good Job'
      redirect_to @brewery
    else
      flash[:error] = 'Boom!'
      render :edit, status: 401
    end
  end


  def edit
    @brewery = Brewery.find params[:id]
  end


  def index
    @breweries = Brewery.order(:name)
  end


  def new
    @brewery = Brewery.new
    render :edit
  end


  def show
    @brewery = Brewery.find params[:id]
  end


  def update
    @brewery = Brewery.find params[:id]
    @brewery.update_attributes permitted_params.brewery
    if @brewery.valid?
      flash[:success] = 'Good Job'
      redirect_to @brewery
    else
      flash[:error] = 'Boom!'
      render :edit, status: 401
    end
  end

end

