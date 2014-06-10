class Brand < ActiveRecord::Base

  belongs_to :brewery

  accepts_nested_attributes_for :brewery

  has_many :price_data

  has_many :packagings, through: :price_data
  has_many :retailers, through: :price_data
  has_many :routes, through: :retailers

  validates :brewery, presence: true
  validates :name, presence: true, uniqueness: { scope: :brewery_id }


  def average_price(route: nil, retailer: nil)
    price_data_for(retailer: retailer, route:route).average(:price_cents).to_f / 100.0
  end


  def brewery_name
    brewery && brewery.name
  end


  def data_point_count(route: nil, retailer: nil)
    price_data_for(retailer: retailer, route: route).count
  end


  def price_data_for(route:nil, retailer: nil)
    p = price_data
    p = price_data_for_retailer(p, retailer: retailer)
    p = price_data_for_route(p, route: route)
  end

private

  def price_data_for_retailer(price_data_collection_proxy, retailer: nil)
    return price_data_collection_proxy if retailer.nil?
    price_data_collection_proxy.where(retailer: retailer)
  end


  def price_data_for_route(price_data_collection_proxy, route: nil)
    return price_data_collection_proxy if route.nil?
    price_data_collection_proxy.joins(:retailer).where('retailers.route_id = ?', route.id)
  end

end