require_relative '../entities/contract_entity'

class FindContractsByDate
  attr_reader :wedding_date

  def initialize(wedding_date)
    @wedding_date = Date.parse(wedding_date.to_s)
  end

  def execute
    Repository.for(:contract).find_all_by_date(wedding_date)
  end
end

