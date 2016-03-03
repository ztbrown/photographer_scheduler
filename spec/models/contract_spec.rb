require 'rails_helper'
require 'spec_helper'

VALID_CONTRACT_PARAMS = {rate: 100, photographer_id: 1, wedding_date: Date.today}
INVALID_CONTRACT_PARAMS_RATE = {photographer_id: 1, wedding_date: Date.today}
INVALID_CONTRACT_PARAMS_PHOTOGRAPHER_ID = {rate: 100, wedding_date: Date.today}
INVALID_CONTRACT_PARAMS_WEDDING_DATE = {rate: 100, photographer_id: 1}

describe Contract do
  describe 'validations' do
    context 'with valid attributes' do
      it 'should throw no error with valid params' do
        expect(Contract.new(VALID_CONTRACT_PARAMS)).to be_valid
      end
    end

    context 'with missing rate' do
      it { expect { Contract.create!(INVALID_CONTRACT_PARAMS_RATE) }.to raise_error(ActiveRecord::RecordInvalid).with_message('Validation failed: Rate can\'t be blank') }
    end

    context 'with missing photographer id' do
      it { expect { Contract.create!(INVALID_CONTRACT_PARAMS_PHOTOGRAPHER_ID) }.to raise_error(ActiveRecord::RecordInvalid).with_message('Validation failed: Photographer can\'t be blank') }
    end

    context 'with missing wedding date' do
      it { expect { Contract.create!(INVALID_CONTRACT_PARAMS_WEDDING_DATE) }.to raise_error(ActiveRecord::RecordInvalid).with_message('Validation failed: Wedding date can\'t be blank') }
    end
  end
end
