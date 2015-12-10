require_relative '../../app/entities/contract_entity'

RSpec.describe ContractEntity, "#init" do
  it "should create a new contract entity" do
    session = ContractEntity.new({})
    expect(session).to_not be_nil
  end
end
