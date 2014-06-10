Unit.instance_eval do
  include NilReturningCoder
end

Unit.define('Barrel') do |bbl|
  bbl.aliases = %w{ BBL BBLS BBLs barrel barrels bbl bbls }
  bbl.definition = Unit.new("31 gallons")
  bbl.display_name = 'barrel'
end
