require_relative '../../../app/repositories/memory_repository/session'

module MemoryRepository
  class SessionRepository
    def initialize
      @records = []
      @id = 1
    end

    def create(attributes = {})
      object = model_class.new(attributes)
      object.id = @id
      @records.push(object)
      @id += 1
      object
    end

    def find_all_by_date(date)
      @records.select do |record|
        record.wedding_date == date
      end
    end

    private

    def model_class
      MemoryRepository::Session
    end
  end
end