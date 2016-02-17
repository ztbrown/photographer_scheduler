shared_examples "contract model" do

  context 'interface' do
    it 'should respond to create' do
      expect(Repository.for(:contract)).to respond_to(:create)
    end
  end

  context 'persisting an object' do
    subject {Repository.for(:contract)}
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

end