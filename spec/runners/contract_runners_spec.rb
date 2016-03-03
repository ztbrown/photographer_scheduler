require './app/runners/contract_runners'

module ContractRunners

  describe ContractRunners do
    let (:context) { double(invoked: true) }

    describe Create do
      describe 'with valid params' do

        let (:repo) { double(new_contract: {}, save_contract: true) }
        let (:runner) {
          Create.new(repo) do |on|
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
          Create.new(repo) do |on|
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

    describe Search do
      let (:repo) { double(find_contracts_by_wedding_date: [{}, {}]) }
      let (:runner) { Search.new(repo) }

      it 'calls find_contracts_by_wedding_date on the repo' do
        runner.run({wedding_date: Date.today})
        expect(repo).to have_received(:find_contracts_by_wedding_date).with(Date.today)
      end

      it 'returns results' do
        expect(runner.run({wedding_date: Date.today})).to eq([{}, {}])
      end
    end

  end
end
