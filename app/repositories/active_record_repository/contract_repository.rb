module ActiveRecordRepository
  class ContractRepository

    def create(attributes = {})
      object = model_class.new(attributes)
      object.save!
      object
    end

    def find_all_by_date(date)
      model_class.where(wedding_date: date)
    end

    private

    def model_class
      ::Contract
    end
  end
end