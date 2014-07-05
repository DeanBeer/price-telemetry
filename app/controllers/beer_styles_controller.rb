class BeerStylesController < ApplicationController

  def index
    @beer_styles = BeerStyle.all_styles
    render :index
  end


  def show
    @beer_style = BeerStyle.find_by_name_or_id params[:id]
    ids = BeerStyle.where(group_id: @beer_style.group_id, label: @beer_style.label).map(&:member_id)
    @members = Brand.where id: ids
    @brands = Brand.includes(:brewery).map { |brand| { name: brand.name, brewery: brand.brewery_name } }
  end

end

