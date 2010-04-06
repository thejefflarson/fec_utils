module FecUtils::ItemizedParsers
  #handles files from http://fec.gov/finance/disclosure/ftpdet.shtml
  
  
  module Base
    
    def self.included(klass)
      #klass.attr_reader :row
      klass.extend ClassMethods
    end
    
    attr_reader :row
    
    def initialize(row)
      @row = row
    end
    
    def column_for(start, length, type)
      send(type, @row.slice(start-1, length))
    end
    
    def string(data)
      data
    end
    
    def date(data)
      Date.strptime(data, "%m%d%Y")
    end
  
    
    def number(data)
      data.to_i
    end
    
    def amount(data)
      overpunch = data.pop
      
      # tk http://fec.gov/finance/disclosure/ftpdet.shtml
    end
    
    
    module ClassMethods
      attr_reader :columns, :lookup_columns

      def column(name, start, length, type = :string)
        @columns ||= []
        @columns << name        
        send :define_method, name do
          column_for(start, length, type)
        end
      end
      
      def column_with_choices(name, start, length, choices)
        @lookup_columns ||= []
        @lookup_columns << name
        send :define_method, name do
          choice = column_for(start, length, type)
          [choice, choices[choice]]          
        end
      end
      
      def all(rows)
        rows.map do |row|
          new(row)
        end
      end
      
    end
    
  end
end