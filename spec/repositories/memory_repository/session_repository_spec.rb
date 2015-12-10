require 'spec_helper'
require_relative '../../../app/repositories/memory_repository/contract'
require_relative '../../shared_examples/repositories/session_examples'

module MemoryRepository
  describe 'In-Memory Contract' do
    before(:all) do
      Repository.register(:contract, MemoryRepository::ContractRepository.new)
    end

    it_behaves_like "contract model"

  end
end
