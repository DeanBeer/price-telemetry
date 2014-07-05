seeds = YAML.load(File.read(File.join(File.dirname(__FILE__), "seeds.yml")))

seeds[:brands].each do |brand|
  b = Brand.where name: brand[:name]
  if b.empty?
    brewery = Brewery.find_or_create_by name: brand[:brewery][:name]
    b = brewery.brands.create! name: brand[:name]
    puts "Created #{brand[:name]} -- #{brand[:brewery][:name]}"
    brand[:beer_styles] && brand[:beer_styles].each { |style| b.add_beer_style style; puts "  #{style}" }
  else
    puts "Found #{brand[:name]} -- #{brand[:brewery][:name]}"
  end
end


seeds[:routes].each do |r|
  puts r
  Route.find_or_create_by r
end


seeds[:retailers].each do |r|
  retailer = Retailer.where name: r[:name]
  if retailer.count == 0
    route = Route.find_or_create_by name: r[:route_name]
    route.retailers.create name: r[:name]
    puts "Created #{r[:name]}"
  else
    puts "Found #{r[:name]}"
  end
end


seeds[:packagings].each do |p|
  package = Packaging.where name: p[:name]
  if package.count == 0
    puts p
    Packaging.find_or_create_by p
  else
    puts "Found #{p[:name]}"
  end
end
