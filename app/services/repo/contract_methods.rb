module Repo
  module ContractMethods

    def new_contract(attrs={})
      Entities::Contract.wrap(Contract.new(attrs))
    end

    def save_contract(contract)
      contract.data.save
    end

    def find_contracts_by_wedding_date(date)
      Entities::Contract.wraps(Contract.where(wedding_date: date))
    end

  end
end
