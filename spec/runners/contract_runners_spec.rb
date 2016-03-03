require './app/runners/contract_runners'

describe ContractRunners do
  let (:context) { double(invoked: true) }

  describe 'with valid params' do

    let (:repo) { double(new_contract: {}, save_contract: true) }
    let (:runner) {
      ContractRunners::Create.new(repo) do |on|
        on.success { |a| context.invoked("SUCCESS", a) }
        on.failure { context.invoked("FAILURE") }
      end
    }
    it 'invokes the success callback' do
      runner.run({})
      expect(context).to have_received(:invoked).with('SUCCESS', {})
    end
  end

  describe 'with invalid params' do

    let (:repo) { double(new_contract: {}, save_contract: false) }
    let (:runner) {
      ContractRunners::Create.new(repo) do |on|
        on.success { |a| context.invoked("SUCCESS", a) }
        on.failure { context.invoked("FAILURE") }
      end
    }
    it 'invokes the success callback' do
      runner.run({})
      expect(context).to have_received(:invoked).with('FAILURE')
    end
  end


end
