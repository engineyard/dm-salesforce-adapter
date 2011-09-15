require 'dm-salesforce-adapter/property'


module DataMapper
  module Adapters
    class SalesforceAdapter < DataObjectsAdapter
      module Property
        class Boolean < ::DataMapper::Property::Integer
          FALSE = 0
          TRUE  = 1

          def load(value)
            [true, 1, '1', 'true', 'TRUE', TRUE].include?(value)
          end

          def typecast(value)
            [true, 1, '1', 'true', 'TRUE', TRUE].include?(value) ? TRUE : FALSE
          end

          def custom?
            true
          end
        end
      end
    end
  end
end
