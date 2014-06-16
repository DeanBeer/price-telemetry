class Retailer < ActiveRecord::Base

  include PriceTelemetry::PrettyParam

  belongs_to :route

  has_many :price_data

  validates :name, presence: true, uniqueness: true

  def route_name
    route && route.name
  end

end
