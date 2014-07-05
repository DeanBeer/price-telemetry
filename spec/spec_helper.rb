require 'simplecov'
require 'support/deferred_garbage_collection'

SimpleCov.start do
  coverage_dir File.join(['public','simplecov'])
end

RSpec.configure do |config|
  config.order = :random
  config.raise_errors_for_deprecations!

  config.before(:all) do
    DeferredGarbageCollection.start
  end

  config.after(:all) do
    DeferredGarbageCollection.reconsider
  end

#  config.before(:suite) do
#    FactoryGirl.lint
#  end

end
