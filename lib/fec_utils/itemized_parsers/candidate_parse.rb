module FecUtils::ItemizedParsers
  class CandidateParse
    include FecUtils::ItemizedParsers::Base
    # from ftp://ftp.fec.gov/FEC/cn_dictionary.txt
    
    column :candidate_information,            1, 9
    column :candidate_name,                  10, 38
    column :party_designation_one,           48, 3
    column :party_designation_three,         54, 3
    column_with_choices :incumbent_status, 57, 1, {
      'I' => 'Incumbent',
      'C' => 'Challenger',
      'O' => 'Open'
    }
    column_with_choices :candidate_status, 59, 1, {
      'C' => 'Statutory Candidate',
      'F' => 'Statutory Candidate For Future Election',
      'N' => 'Not Yet a Statutory Candidate',
      'P' => 'Statutory Candidate in Prior Cycle'
    }
    column :street_one,                      60, 34
    column :street_two,                      94, 34
    column :city_or_town,                   128, 18
    column :state,                          146, 2
    column :zip_code,                       148, 5
    column :principal_campaign_comittee_id, 153, 9
    column :year_of_election,               162, 2
    column :current_district,               164, 2
    
  end
end