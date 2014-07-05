module PriceTelemetry::GroupMember

  extend ActiveSupport::Concern

  included do |base|
    has_many :group_memberships, as: :member
    has_many :groups, through: :group_memberships
  end

  def add_group_membership(label, group, cache=Rails.cache)
    cache.fetch [self, group, label] do
      group_memberships.where(group: group, label: label).first ||
        group_memberships.create(group: group, label: label)
    end
  end


end
