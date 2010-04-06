module FecUtils::ItemizedParsers
  class PasParse
    include FecUtils::ItemizedParsers::Base
    # from ftp://ftp.fec.gov/FEC/pas2_dictionary.txt
    
    column :indent_number,              1, 9
    column :amendment_indicator,       10, 1
    column :report_type,               11, 3
    column :primary_general_indicator, 14, 1
    column :microfilm_location,        15, 11
    column :transaction_type,          26, 3
    column :transaction_date,          29, 8, :date 
    column :amount,                    37, 7, :amount
    column :other_identification,      44, 9
    column :candidate_identification,  53, 9
    column :fec_record,                62, 7
    
    
    class << self
      def rows_by_transaction_type(rows, types)
        parsed_rows = rows.map do |row|
          parser = PasParse.new(row)
          parser if types.include? parser.transaction_type
        end
        parsed_rows.compact
      end
      
      def count_by_transaction_type(rows)
        hash = Hash.new(0)
        parsed_rows = rows.map do |row|
          parser = PasParse.new(row)
          hash[parser.transaction_type] += 1
        end
        hash
      end
      
    end
    
  end
end  
