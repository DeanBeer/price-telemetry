require 'simplecov'

SimpleCov.start do
  coverage_dir File.join(['public','simplecov'])
end

RSpec.configure do |config|
  config.order = :random
  config.raise_errors_for_deprecations!
end


