class GroupMembership < ActiveRecord::Base

  belongs_to :group
  belongs_to :member, polymorphic: true

  validates :group, presence: true
  validates :label, length: { maximum: 40 }
  validates :member, presence: true

end
