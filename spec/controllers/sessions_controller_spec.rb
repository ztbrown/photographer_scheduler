require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  context "#create" do
    it "should create a new session" do
      expect {
        post :create, sessions: [{ date: Date.new }]
      }.to change { Session.count }.by(1)

      response.response_code.should == 200
    end
  end
end
