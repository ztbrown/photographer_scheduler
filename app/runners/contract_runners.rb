require './app/runners/runner'

module ContractRunners
  class Create < Runner
    def run(contract_params)
      contract = repo.new_contract(contract_params)
      if repo.save_contract(contract)
        success(contract)
      else
        failure(contract)
      end
    end
  end

  class Search < Runner
    def run(contract_params)
      repo.find_contracts_by_wedding_date(contract_params[:wedding_date])
    end
  end
end
