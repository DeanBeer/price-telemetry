class BeerStyle < GroupMembership

  def self.all_styles
    where(group_id: Group.beer_style).select(:label).order(:label).distinct
  end


  def self.find_by_name_or_id(id)
    if id.to_i.to_s == id.to_s
      find id
    else
      where( group: Group.beer_style, label: id ).first
    end
  end

end
