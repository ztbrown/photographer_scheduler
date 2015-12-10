require_relative "../entities/contract_entity"

class FindContractsByDate
  attr_reader :wedding_date

  def initialize(wedding_date)
    @wedding_date = Date.parse(wedding_date)
  end

  def execute
    #TODO: refactor out the dependency on contract structure. Repository.for().find_all... should return an array
    contracts = []
    Repository.for(:contract).find_all_by_date(wedding_date).each do |contract|
      contracts.push(contract.attributes)
    end
    contracts
  end
end

