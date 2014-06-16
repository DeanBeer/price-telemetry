class Route < ActiveRecord::Base

  include PriceTelemetry::PrettyParam

  has_many :retailers

  validates :name, presence: true

end
