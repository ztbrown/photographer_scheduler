require './app/runners/named_callbacks'

describe NamedCallbacks do

  describe 'with a named callback' do
    let (:nc) {NamedCallbacks.new}
    before(:each) do
      @args = [ ]
      nc.ok { |*a| @args.replace(a) }
    end
    it 'assigns a named callback to a symbol' do
      nc.call(:ok, 1, 2, 3)
      expect(@args).to eq([1, 2, 3])
    end

    it 'assigns a named callback to a string' do
      nc.call('ok', 1, 2, 3)
      expect(@args).to eq([1, 2, 3])
    end
  end

  describe 'without a named callback' do
    let (:nc) {NamedCallbacks.new}
    before(:each) do
      @args = [ ]
    end
    it 'assigns a named callback to a symbol' do
      nc.call(:ok, 1, 2, 3)
      expect(@args).to eq([])
    end

    it 'assigns a named callback to a string' do
      nc.call('ok', 1, 2, 3)
      expect(@args).to eq([])
    end
  end

end
