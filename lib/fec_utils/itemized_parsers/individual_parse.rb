module FecUtils::ItemizedParsers
  class IndividualParse
    include FecUtils::ItemizedParsers::Base
    
    column :filer_identification_number,   1, 9
    column :amendment_indicator,          10, 1
    column :report_type,                  11, 3
    column :primary_general_indicator,    14, 1
    column :microfilm_location,           15, 11
    column :transaction_type,             26, 3
    column :contributor_name,             29, 34
    column :city_or_town,                 63, 18
    column :state,                        81, 2
    column :zip_code,                     83, 5
    column :occupation,                   88, 35
    column :transaction_date,            123, 8, :date
    column :amount,                      131, 7, :amount
    column :other_identification,        138, 9
    column :fec_record,                  147, 7
  end
end