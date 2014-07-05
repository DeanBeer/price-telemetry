class Retailer < ActiveRecord::Base

  include PriceTelemetry::GroupMember
  include PriceTelemetry::PrettyParam

  belongs_to :route

  has_many :price_data, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def add_class(label, group = Group.retailer_class)
    add_group_membership label, group
  end


  def route_name
    route && route.name
  end

end
