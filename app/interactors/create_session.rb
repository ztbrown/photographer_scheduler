require_relative "../entities/session_entity"

class CreateSession
  attr_reader :session

  def initialize(args)
    @session = SessionEntity.new(args)
  end

  def execute

  end
end

