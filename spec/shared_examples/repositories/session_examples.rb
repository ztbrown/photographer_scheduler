shared_examples "contract model" do

  context 'interface' do
    it 'should respond to create' do
      expect(Repository.for(:contract)).to respond_to(:create)
    end
  end

  context 'persisting an object' do

    subject { Repository.for(:contract) }

    it 'should create a new contract object with rate set to 100' do
      expect(subject.create({rate: 100}).rate).to eq(100)
    end

    it 'should create a new contract object with date set to today' do
      expect(subject.create({wedding_date: Date.today}).wedding_date).to eq(Date.today)
    end

    it 'should create a new contract object with a photographer id of 1' do
      expect(subject.create({photographer_id: 1}).photographer_id).to eq(1)
    end
  end

  context 'find all contracts by date' do

    subject { Repository.for(:contract) }

    before { 3.times{|x| subject.create({rate: 100, photographer_id: 1, wedding_date: Date.today + 1})} }

    it 'should find all contracts by date' do
      subject.find_all_by_date(Date.today + 1).each.with_index {|contract, index|
        expect(contract.photographer_id).to eq(1)
        expect(contract.wedding_date).to eq(Date.today + 1)
        expect(contract.rate).to eq(100)
      }
    end

    it 'should return an array' do
      expect(subject.find_all_by_date(Date.today + 1).class).to eq(Array)
    end
  end

end