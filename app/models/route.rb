class Route < ActiveRecord::Base

  has_many :retailers

  validates :name, presence: true

end
