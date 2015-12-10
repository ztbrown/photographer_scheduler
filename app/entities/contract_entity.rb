class ContractEntity
  attr_reader :id, :rate, :photographer_id, :customer_id, :wedding_date

  def initialize(args)
    @rate = args[:rate]
    @photographer_id = args[:photographer_id]
    @wedding_date = args[:wedding_date]
    @customer_id = args[:customer_id]
    @id = args[:id]
  end

  def attributes
    {id: id, rate: rate, photographer_id: photographer_id, customer_id: customer_id, wedding_date: wedding_date}
  end

end

