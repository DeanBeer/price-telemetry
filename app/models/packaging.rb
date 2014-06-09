class Packaging < ActiveRecord::Base

  has_many :price_data

  validates :name, uniqueness: { allow_blank: true }

  validates :quantity, numericality: { only_integer: true }, presence: true
  validates :volume, numericality: { only_integer: true }, presence: true


  def name
    return read_attribute(:name) if name?
    "#{quantity} x #{volume}"
  end

end
