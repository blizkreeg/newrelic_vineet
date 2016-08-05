require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe "POST" do
    let(:org) { Org.first }

    it "creates event" do
      post :create, org_id: Org.first.id, event_name: "event #{SecureRandom.hex}", event_host: "testhost", ts: Time.now.to_i
      expect(response).to have_http_status(:created)
      payload = JSON.parse(response.body)
      expect(Event.where(id: payload["event_id"])).to exist
    end
  end
end
