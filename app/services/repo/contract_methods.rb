module Repo
  module ContractMethods

    def new_contract(attrs={})
      Entities::Contract.wrap(Contract.new(attrs))
    end

    def save_contract(contract)
      contract.data.save
    end

  end
end
