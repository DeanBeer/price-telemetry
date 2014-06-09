class BrandsController < ApplicationController

  def create
    @brand = Brand.create permitted_params.brand
    if @brand.valid?
      flash[:success] = 'Good Job'
      redirect_to @brand
    else
      flash[:error] = 'Boom!'
      render :edit, status: 401
    end
  end


  def edit
    @brand = Brand.find params[:id]
  end


  def index
    @brands = Brand.joins(:brewery).order('breweries.name,brands.name')
  end


  def new
    @brand = Brand.new
    render :edit
  end


  def show
    @brand = Brand.find params[:id]
  end


  def update
    @brand = Brand.find params[:id]
    @brand.update_attributes permitted_params.brand
    if @brand.valid?
      flash[:success] = 'Good Job'
      redirect_to @brand
    else
      flash[:error] = 'Boom!'
      render :edit, status: 401
    end
  end

end

