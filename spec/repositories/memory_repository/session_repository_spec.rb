require File.dirname(__FILE__) + '/../../../app/repositories/memory_repository/contract'
require File.dirname(__FILE__) + '/../../shared_examples/repositories/session_examples'
require File.dirname(__FILE__) + '/../../../app/repositories/repository'
require File.dirname(__FILE__) + '/../../../app/repositories/memory_repository/contract_repository'


describe 'In-Memory Contract' do
  before(:each) do
    Repository.register(:contract, MemoryRepository::ContractRepository.new)
  end

  it_behaves_like "contract model"

end

