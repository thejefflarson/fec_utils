module FecUtils::ItemizedParsers
  class CommitteeParse
    include FecUtils::ItemizedParsers::Base
    # from ftp://ftp.fec.gov/FEC/cm_dictionary.txt
    
    column :committee_identification,   1, 9
    column :committee_name,            10, 90
    column :treasurers_name,          100, 38
    column :street_one,               138, 34
    column :street_two,               172, 34
    column :city_or_town,             206, 18
    column :state,                    224, 2
    column :zip_code,                 226, 5
    
    column_with_choices :committee_designation, 231, 1, {
      'A' => 'Authorized by Candidate',
      'J' => 'Joint Fund Raiser',
      'P' => 'Principal Campaign Committee of a Candidate',
      'U' => 'Unauthorized',
      'B' => 'Lobbyist/Registrant PAC',
      'D' => 'Leadership PAC'
    }
    
    column_with_choices :committee_type, 232, 1, {
      'C' => 'Communication Cost',
      'D' => 'Delegate',
      'H' => 'House',
      'I' => 'Independent Expenditure (Person or Group, Not a Committee)',
      'N' => 'Non-Party Non-Qualified',
      'P' => 'Presidential',
      'Q' => 'Qualified Non-Party',
      'S' => 'Senate',
      'X' => 'Non-Qualified Party',
      'Y' => 'Qualified Party',
      'Z' => 'National Party Organization',
      'E' => 'Electioneering Communication'
    }
    
    column :committee_party,          233, 3
    column_with_choices :filing_frequency, 236, 1, {
      'A' => 'Administratively Terminated',
      'D' => 'Debt',
      'M' => 'Monthly Filer',
      'W' => 'Quarterly Filer',
      'T' => 'Terminated',
      'W' => 'Waived'
    }
    column_with_choices :interest_group_category,  237, 1, {
      'C' => 'Corporation',
      'L' => 'Labor Organization',
      'M' => 'Membership Organization',
      'V' => 'Cooperative',
      'W' => 'Corporation Without Capital Stock'
    }
    column :connected_organization,   238, 38
    column :candidate_identification, 276, 9

  end
end