module PriceTelemetry::PrettyParam

  def to_param
    [id.to_s, url_clean_name].compact.join('-')
  end

protected

  def url_clean_name
    return nil unless respond_to?(:name)
    return nil unless name.respond_to?(:gsub)
    return nil if name.blank?
    name.gsub(/\W/,'_')
  end

end

