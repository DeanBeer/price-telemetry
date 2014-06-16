class Brewery < ActiveRecord::Base

  include PriceTelemetry::PrettyParam

  has_many :brands

  validates :name, presence: true, uniqueness: true

end
