require_relative '../../app/interactors/create_contract'
require_relative '../../app/interactors/find_contracts_by_date'

class SessionContract
  def self.create(params)
    CreateContract.new(params).execute()
  end

  def self.find_by_date(params)
    FindContractsByDate.new(params).execute()
  end
end
