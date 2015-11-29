require_relative '../../app/entities/session_entity'

RSpec.describe SessionEntity, "#init" do
  it "should create a new session entity" do
    session = SessionEntity.new({})
    expect(session).to_not be_nil
  end
end
