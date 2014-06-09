seeds = YAML.load(File.read(File.join(File.dirname(__FILE__), "seeds.yml")))

seeds[:brands].each do |brand|
  b = Brand.where name: brand[:name]
  if b.empty?
    brewery = Brewery.find_or_create_by name: brand[:brewery][:name]
    brewery.brands.create! name: brand[:name]
    puts "Created #{brand[:name]} -- #{brand[:brewery][:name]}"
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
    Retailer.create! r
    puts "Created #{r[:name]}"
  else
    puts "Found #{r[:name]}"
  end
end


seeds[:packagings].each do |p|
  puts p
  Packaging.find_or_create_by p
end
