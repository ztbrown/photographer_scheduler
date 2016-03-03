require './app/facades/session_contract'
require './app/interactors/create_contract'
require './app/repositories/repository'
require './app/repositories/memory_repository/contract_repository'

describe SessionContract do

  context 'creating a contract' do
    before(:each) do
      Repository.register(:contract, MemoryRepository::ContractRepository.new)
      @contract = SessionContract.create({rate: 100, photographer_id: 1, customer_id: 1, wedding_date: Date.today})
    end

    it 'creates a new contract with rate 100' do
      expect(@contract.rate).to eq(100)
    end

    it 'creates a new contract with photographer_id 1' do
      expect(@contract.photographer_id).to eq(1)
    end

    it 'creates a new contract with customer_id 1' do
      expect(@contract.customer_id).to eq(1)
    end

    it 'creates a new contract with wedding_date today' do
      expect(@contract.wedding_date).to eq(Date.today)
    end
  end

  context 'finding contracts by date' do
    before(:each) do
      Repository.register(:contract, MemoryRepository::ContractRepository.new)
      3.times {|x| SessionContract.create({rate: 100, photographer_id: 1, wedding_date: Date.today})}
      5.times {|x| SessionContract.create({rate: 100, photographer_id: 1, wedding_date: Date.today + 1})}
      @today_contracts = SessionContract.find_by_date(Date.today)
      @tomorrow_contracts = SessionContract.find_by_date(Date.today + 1)
    end

    it 'finds all contracts for today' do
      expect(@today_contracts.length).to eq(3)
    end

    it 'finds all contracts for tomorrow' do
      expect(@tomorrow_contracts.length).to eq(5)
    end

  end

end
