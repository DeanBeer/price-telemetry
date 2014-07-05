class Brewery < ActiveRecord::Base

  include PriceTelemetry::PrettyParam

  has_many :brands, dependent: :destroy

  validates :name, presence: true, uniqueness: true

end
