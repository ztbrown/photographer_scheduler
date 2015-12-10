require_relative '../../app/interactors/create_contract'

RSpec.describe CreateContract, "#create" do
  before(:all) do
    Repository.register(:contract, MemoryRepository::ContractRepository.new)
  end
  it "should respond to execute" do
    expect(CreateContract.new({})).to respond_to(:execute)
  end
  context "given a valid request model" do
    it "should create a new contract when some values are provided" do
      contract = CreateContract.new({rate: 100, wedding_date: Date.new, photographer_id: 1}).execute
      expect(contract).to_not be_nil
    end
  end
end
