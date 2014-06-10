require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module PriceTelemetry
  class Application < Rails::Application
     Dir.glob(File.join(config.root, "app", "extensions", "**")).each { |f| require f }
  end
end
