require_relative "../entities/session_entity"

class FindSessionsByDate
  attr_reader :session, :wedding_date

  def initialize(wedding_date)
    @wedding_date = wedding_date
  end

  def execute
    sessions = []
    Repository.for(:session).find_all_by_date(wedding_date).each do |session|
      sessions.push(session.attributes)
    end
    sessions
  end
end

