require './app/runners/runner'

describe Runner do
  let (:context) { double(invoked: true) }
  let (:runner) {
    Runner.new(context) do |on|
      on.success { |a, b| context.invoked("SUCCESS", a, b) }
      on.failure { |a, b| context.invoked("FAILURE", a, b) }
      on.other   { |a, b| context.invoked("OTHER", a, b) }
    end
  }

  describe 'calling success' do

    it 'should send SUCCESS to context' do
      result = runner.success(:first, :second)
      expect(context).to have_received(:invoked).with("SUCCESS", :first, :second)
      expect(result).to eq([:first, :second])
    end

  end

  describe 'calling failure' do

    it 'should send FAILURE to context' do
      result = runner.failure(:first, :second)
      expect(context).to have_received(:invoked).with("FAILURE", :first, :second)
      expect(result).to eq([:first, :second])
    end

  end

  describe 'calling other' do

    it 'should send OTHER to context' do
      result = runner.callback(:other, :first, :second)
      expect(context).to have_received(:invoked).with("OTHER", :first, :second)
      expect(result).to eq([:first, :second])
    end

  end

  describe 'calling unknown' do

    it 'should send OTHER to context' do
      result = runner.callback(:unknown, :first, :second)
      expect(context).not_to have_received(:invoked)
      expect(result).to eq([:first, :second])
    end

  end


end
