require_relative '../entities/contract_entity'

class CreateContract
  attr_reader :contract

  def initialize(args)
    @contract = ContractEntity.new(args)
  end

  def execute
    Repository.for(:contract).create(contract.attributes)
  end
end

