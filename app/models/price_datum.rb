class PriceDatum < ActiveRecord::Base

  after_initialize :initialize_date
  after_initialize :initialize_on_special

  belongs_to :brand, inverse_of: :price_data
  belongs_to :packaging, inverse_of: :price_data
  belongs_to :retailer, inverse_of: :price_data

  monetize :price_cents

  validates :date, presence: true
  validates :packaging, presence: true
  validates :on_special, inclusion: { in: [true,false] }
  validates :retailer, presence: true

  validates :price_cents, numericality: { greater_than: 0 }, presence: true


  def brand_name
    brand && brand.name
  end


  def brewery_name
    brand && brand.brewery_name
  end


  def retailer_name
    retailer && retailer.name
  end


  def package_name
    packaging && packaging.name
  end

private

  def initialize_date
    self.date ||= Date.today
  end


  def initialize_on_special
    self.on_special.nil? && self.on_special = false
  end

end
