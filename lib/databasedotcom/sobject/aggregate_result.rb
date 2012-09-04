module Databasedotcom
  module Sobject
    class AggregateResult
      
      def initialize(raw_result)
        @vals = raw_result.inject({}) do |hsh,(k,v)|
          hsh[k.to_sym] = v
          hsh
        end
      end
      
      def method_missing(field, *args)
        unless @vals.key?(field)
          raise NoMethodError, "undefined method #{field} for #{self}"
        else
          @vals[field]
        end
      end
      
    end
  end
end