require File.dirname(__FILE__) +  '/../../../app/repositories/active_record_repository/contract_repository'
require File.dirname(__FILE__) +  '/../../shared_examples/repositories/session_examples'

require 'spec_helper'
require 'rails_helper'

  describe 'ActiveRecord Contract' do
    before(:each) do
      Repository.register(:contract, ActiveRecordRepository::ContractRepository.new)
    end

    it_behaves_like "contract model"

  end

