require File.dirname(__FILE__) +  '/../../app/interactors/find_contracts_by_date'
require File.dirname(__FILE__) +  '/../../app/repositories/repository'
require File.dirname(__FILE__) +  '/../../app/repositories/memory_repository/contract_repository'

describe FindContractsByDate, "#execute" do
  before(:each) do
    Repository.register(:contract, MemoryRepository::ContractRepository.new)
  end
  context "given a valid date in the future" do
    before(:each) do
      3.times{
        Repository.for(:contract).create({wedding_date: Date.today + 1})
        Repository.for(:contract).create({wedding_date: Date.today + 2})
      }
    end
    it "should find all contracts on the given date" do
      results = FindContractsByDate.new((Date.today + 1).to_s).execute()
      expect(results.length).to be(3)
    end
  end
end
