require 'spec_helper'
require_relative '../../app/interactors/find_sessions_by_date'
require_relative '../../app/repositories/repository'

RSpec.describe FindSessionsByDate, "#execute" do
  context "given a valid date in the future" do
    before(:each) do
      3.times{
        Repository.for(:session).create({wedding_date: Date.today + 1})
      }
    end
    it "should find all sessions on the given date" do
      results = FindSessionsByDate.new((Date.today + 1).to_s).execute()
      expect(results.length).to be(3)
    end
  end
end
