require './app/interactors/create_contract'
require './app/repositories/repository'
require './app/repositories/memory_repository/contract_repository'

describe CreateContract, "#create" do
  before(:each) do
    Repository.register(:contract, MemoryRepository::ContractRepository.new)
  end
  subject {CreateContract.new({})}
  it "should respond to execute" do
    expect(subject).to respond_to(:execute)
  end
  context "given a valid request model" do
    subject {CreateContract.new({rate: 100, wedding_date: Date.today, photographer_id: 1})}
    it "should create a contract with a rate of 100" do
      expect(subject.execute.rate).to eq(100)
    end
    it "should create a contract with a photographer id of 1" do
      expect(subject.execute.photographer_id).to eq(1)
    end
    it "should create a contract with a wedding date of" do
      expect(subject.execute.wedding_date).to eq(Date.today)
    end
  end
end
