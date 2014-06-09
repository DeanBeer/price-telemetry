class Brewery < ActiveRecord::Base

  has_many :brands

  validates :name, presence: true, uniqueness: true

end
