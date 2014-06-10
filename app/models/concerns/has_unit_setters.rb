module HasUnitSetters
  extend ActiveSupport::Concern
  class UnitParseError < ArgumentError; end

  module ClassMethods

    def define_unit_setter(attr)
      name = attr.to_s
      class_eval %Q?
        def #{name}=(amount)
          write_attribute("#{name}", amount.to_unit )
        rescue ArgumentError => e
          raise UnitParseError.new e.message
        end
      ?
    end


    def unit_setters(*attrs)
      attrs.each do |attr|
        define_unit_setter attr
        serialize attr, Unit
      end
    end
    alias_method :unit_setter, :unit_setters

  end

end
