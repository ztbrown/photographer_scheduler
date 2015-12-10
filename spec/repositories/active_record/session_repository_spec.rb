require_relative '../../../app/repositories/active_record_repository/contract_repository'
require_relative '../../shared_examples/repositories/session_examples'

module ActiveRecordRepository
  describe 'ActiveRecord Contract' do
    before(:all) do
      Repository.register(:contract, ActiveRecordRepository::SessionRepository.new)
    end

    it_behaves_like "contract model"

  end
end
