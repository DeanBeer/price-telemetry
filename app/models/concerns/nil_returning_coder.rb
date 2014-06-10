require 'active_record/coders/yaml_column'
require 'active_support'
require 'yaml'
# This module defines an YAMLColumn coder that returns
#   nil instead of a blank object.  Useful when the class you are serializing
#   to/from does not allow uninitialized objects (such as a unit measurement)
module NilReturningCoder

  extend ActiveSupport::Concern

  module ClassMethods
    def dump(obj)
      Coder.new.dump(obj)
    end
    def load(yaml)
      Coder.new.load(yaml)
    end
  end

private

  class Coder < ActiveRecord::Coders::YAMLColumn
    def dump(obj)
      return if obj.blank?
      super
    end
    def load(yaml)
      return if yaml.blank?
      super
    end
  end

end
