class Group < ActiveRecord::Base

  validates :name, length: { maximum: 40 }, presence: true, uniqueness: true

  has_many :group_memberships

  has_many :brands, through: :group_memberships,
                    source: :member,
                    source_type: Brand

  has_many :retailers, through: :group_memberships,
                       source: :member,
                       source_type: Retailer

  class << self

    def beer_style; create_or_find :beer_style; end
    def retailer_class; create_or_find :retailer_class; end

  private

    def create_or_find(name,cache=Rails.cache)
      cache.fetch [self,name] do
        where(name: name).first || create(name: name)
      end
    end

  end

end
