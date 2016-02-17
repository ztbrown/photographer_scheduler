require File.dirname(__FILE__) + '/../../app/entities/contract_entity'

describe ContractEntity, "#init" do
  subject {ContractEntity.new({})}
  it "should create a new contract entity" do
    expect(subject).to_not be_nil
  end
end
