class RoutesController < ApplicationController

  def create
    @route = Route.create permitted_params.route
    if @route.valid?
      flash[:success] = 'Good Job'
      redirect_to @route
    else
      flash[:error] = 'Boom!'
      render :edit, status: 401
    end
  end


  def edit
    @route = Route.find params[:id]
  end


  def index
    @routes = Route.all.order :name
  end


  def new
    @route = Route.new
    render :edit
  end


  def show
    @route = Route.find params[:id]
  end


  def update
    @route = Route.find params[:id]
    @route.update_attributes permitted_params.route
    if @route.valid?
      flash[:success] = 'Good Job'
      redirect_to @route
    else
      flash[:error] = 'Boom!'
      render :edit, status: 401
    end
  end

end

