require_relative '../../app/interactors/find_contracts_by_date'
require_relative '../../app/repositories/repository'

RSpec.describe FindContractsByDate, "#execute" do
  before(:all) do
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
