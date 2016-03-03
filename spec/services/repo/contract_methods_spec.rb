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
    describe '#new_contract' do
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

    describe '#save_contract' do
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

    describe '#find_contracts_by_wedding_date' do
      context 'with a valid date and one match in the db' do
        before(:each) do
          @contract = repo.new_contract(CONTRACT_PARAMS)
          repo.save_contract(@contract)
        end
        it { expect(repo.find_contracts_by_wedding_date(Date.today)).to eq([@contract]) }
      end

      context 'with a valid date and multiple matches in the db' do
        before(:each) do
          @contract = repo.new_contract(CONTRACT_PARAMS)
          @contract1 = repo.new_contract(CONTRACT_PARAMS)
          @contract2 = repo.new_contract(CONTRACT_PARAMS)
          repo.save_contract(@contract)
          repo.save_contract(@contract1)
          repo.save_contract(@contract2)
        end
        it {expect(repo.find_contracts_by_wedding_date(Date.today)).to eq([@contract, @contract1, @contract2])}
      end

      context 'with an invalid date' do
        before(:each) do
          @contract = repo.new_contract(CONTRACT_PARAMS)
          repo.save_contract(@contract)
        end
        it {expect(repo.find_contracts_by_wedding_date(nil)).to eq([])}
      end
    end

  end
end
