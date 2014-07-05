#$:.unshift(File.dirname(__FILE__) + '/../../../../../db/migrate')
#require 'shared/rails_helper'
#require '20140620192942_create_groups'
#
#RSpec.configure do |config|
#  config.before(:suite) do
#    DatabaseCleaner[:active_record].strategy = :transaction
#  end
#
#  config.before(:each) do
#    DatabaseCleaner[:active_record].start
#  end
#
#  config.after(:each) do
#    DatabaseCleaner[:active_record].clean
#  end
#end
#
#ActiveRecord::Base.establish_connection( :adapter => 'sqlite3', :database => ":memory:" )
#
#ActiveRecord::Schema.define(:version => 1) do
#  create_table :llamas
#end
#
#ActiveRecord::Migration.verbose = false
#CreateGroups.new.change
#
#class Llama < ActiveRecord::Base
#  include PriceTelemetry::GroupMember
#end
#
#describe Llama do
#
#  it { should have_many :group_memberships }
#  it { should have_many(:groups).through(:group_memberships) }
#
#end
