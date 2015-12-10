module MemoryRepository
  class Contract
    attr_accessor :id, :rate, :photographer_id, :customer_id, :wedding_date

    def initialize(args)
      @rate = args[:rate]
      @photographer_id = args[:photographer_id]
      @wedding_date = args[:wedding_date]
      @customer_id = args[:customer_id]
    end

    def attributes
      {rate: rate, photographer_id: photographer_id, customer_id: customer_id, id: id, wedding_date: wedding_date}
    end
  end
end