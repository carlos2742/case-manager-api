require 'rails_helper'

RSpec.describe Client, type: :model do
  context "with one client" do
    it "fields exist" do
      attr = valid_client_attributes
      client = Client.create(attr)
      expect(client.first_name).to eq(attr['first_name'])
    end
  end
end
