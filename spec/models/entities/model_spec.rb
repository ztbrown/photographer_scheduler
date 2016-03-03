require './app/models/entities/model'
require './app/models/entities/mimic'

module Entities
  DataModel = Struct.new(:wedding_date, :rate, :photographer_id, :customer_id) do
    include Entities::Mimic
  end

  describe Entities::Model do

    let (:data) { DataModel.new(Date.today, 100, 1, 2) }
    let (:other_data) { DataModel.new(Date.today + 1, 200, 2, 3) }
    let (:model) { Model.wrap(data) }
    let (:collection) { Model.wraps([data, data, data, data])}

    it 'identifies as an entity object' do
      expect(model.entity?).to be(true)
    end

    it 'exposes the underlying data object on request' do
      expect(model.data.entity?).to be(false)
    end

    it 'mimics underlying data' do
      expect(model.wedding_date).to eq(Date.today)
      expect(model.rate).to eq(100)
      expect(model.photographer_id).to eq(1)
      expect(model.customer_id).to eq(2)
    end

    it 'lies about its class' do
      expect(model.class).to be(model.data.class)
    end

    it 'compares equal to other equivalent models' do
      expect(model).to eq(data)
      expect(model).to eq(Model.wrap(data))
      expect(data).to eq(model)
    end

    it 'compares not-equal to other stuff' do
      expect(model).to_not eq(other_data)
      expect(other_data).to_not eq(model)
      expect(model).to_not eq(Model.wrap(other_data))
      expect(Model.wrap(other_data)).to_not eq(model)
    end

    it 'prohibits ActiveRecord methods' do
      expect{model.save}.to raise_error(Entities::ActiveRecordNotAvailableError)
    end

    it 'returns nil when wrapping nil objects' do
      expect(Model.wrap(nil)).to be(nil)
    end

    it 'can wrap collections' do
      expect(collection).to contain_exactly( data, data, data, data )
      collection.each do |item|
        expect(item.entity?).to be(true)
      end
    end
  end
end
