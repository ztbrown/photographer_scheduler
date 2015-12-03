require 'spec_helper'
require_relative '../../../app/repositories/memory_repository/session'
#require 'spec/shared_examples/repositories/session_examples'

module MemoryRepository
  describe 'In-Memory Session' do
    before(:all) do
      Repository.register(:session, MemoryRepository::SessionRepository.new)
    end
  end
end
