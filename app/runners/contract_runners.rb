require_relative '../../app/runners/runner'

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
end
