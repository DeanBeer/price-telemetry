class Packaging < ActiveRecord::Base

  composed_of :volume, allow_nil: true, # for specs
                       class_name: 'Unit',
                       mapping: [ %w(volume_scalar scalar), %w(volume_units units) ]

  has_many :price_data

  validates :name, uniqueness: { allow_blank: true }

  validates :material, presence: true
  validates :quantity, numericality: { only_integer: true }, presence: true
  validates :volume_scalar, presence: true
  validates :volume_units, presence: true

  def name
    return read_attribute(:name) if name?
    "#{quantity} x #{volume}"
  end

end
