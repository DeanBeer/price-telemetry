ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../../config/environment", __FILE__)
require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!

silence_stream STDOUT do
  load File.join [ Rails.root, 'db', 'schema.rb' ]
end

RSpec.configure do |config|
  config.use_transactional_fixtures = true
end
