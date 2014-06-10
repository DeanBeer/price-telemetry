class Packaging < ActiveRecord::Base

  include HasUnitSetters

  has_many :price_data

  unit_setters :volume

  validates :name, uniqueness: { allow_blank: true }

  validates :material, presence: true
  validates :quantity, numericality: { only_integer: true }, presence: true
  validates :volume, presence: true


  def name
    return read_attribute(:name) if name?
    "#{quantity} x #{volume}"
  end

end
