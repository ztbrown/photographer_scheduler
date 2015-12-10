shared_examples "contract model" do
  it 'should respond to create' do
    expect(Repository.for(:contract)).to respond_to(:create)
  end
end