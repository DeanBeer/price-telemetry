class BeerStylesController < ApplicationController

  def create
    @beer_style = BeerStyle.create permitted_params.beer_style
    if @beer_style.valid?
      flash[:success] = 'Good Job'
      redirect_to beer_styles_url
    else
      index
    end
  end


  def index
    @beer_styles = BeerStyle.where(group_id: Group.beer_style).select(:label).order(:label).distinct
    render :index
  end


  def show
    @beer_style = BeerStyle.find_by_name_or_id params[:id]
    ids = BeerStyle.where(group_id: @beer_style.group_id, label: @beer_style.label).map(&:member_id)
    @members = Brand.where id: ids
    @brands = Brand.includes(:brewery).map { |brand| { name: brand.name, brewery: brand.brewery_name } }
  end

end

