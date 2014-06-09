class Brand < ActiveRecord::Base

  belongs_to :brewery

  accepts_nested_attributes_for :brewery

  has_many :price_data

  has_many :retailers, through: :price_data
  has_many :packagings, through: :price_data

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


  def routes
    retailers.collect(&:route).uniq
  end

private

  def price_data_for(route:nil, retailer: nil)
    p = price_data
    if retailer
      p = p.where retailer: retailer
    end

    if route
      p = p.joins(:retailer).where retailers: { route: route }
    end
    p
  end

end
