require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "retrieves" do
    let(:org) { Org.first }

    it "10 most recent events for an org" do
      events = Event.last_n(org, 10)
      events.each do |event|
        ts ||= event.ts

        expect(event.org.name).to eq(org.name)
        expect(event.ts).to be <= event.ts

        ts = event.ts
      end
    end
  end
end
