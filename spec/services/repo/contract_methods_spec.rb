require 'rails_helper'
require './app/services/repo/contract_methods'
require './app/models/entities/contract'

module Repo

  CONTRACT_PARAMS = {rate: 100, photographer_id: 1, wedding_date: Date.today}

  class ContractRepo
    include ContractMethods
  end

  describe ContractMethods do
    let(:repo) { ContractRepo.new }
    describe '#new contract' do
      context 'without attributes' do
        it { expect(repo.new_contract.new_record?).to be(true) }
      end
      context 'with attributes' do
        it {
          expect(repo.new_contract(CONTRACT_PARAMS).rate).to eq(100)
          expect(repo.new_contract(CONTRACT_PARAMS).photographer_id).to eq(1)
          expect(repo.new_contract(CONTRACT_PARAMS).wedding_date).to eq(Date.today)
        }
      end
    end

    describe '#save contract' do
      context 'without attributes' do
        it 'will return false' do
          expect(repo.save_contract(repo.new_contract)).to be(false)
        end
        it 'will not create a new record' do
          contract = repo.new_contract
          repo.save_contract(contract)
          expect(contract.persisted?).to be(false)
        end
      end
      context 'with attributes' do
        it 'will return true' do
          expect(repo.save_contract(repo.new_contract(CONTRACT_PARAMS))).to eq(true)
        end
        it 'will create a new record' do
          contract = repo.new_contract(CONTRACT_PARAMS)
          repo.save_contract(contract)
          expect(contract.persisted?).to be(true)
        end
      end
    end

  end
end
