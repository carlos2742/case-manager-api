# frozen_string_literal: true

require "rails_helper"

RSpec.describe CaseManagerApiSchema do
  describe ".resolve_type" do
    it "resolves the given type dynamically" do
      [Client].each do |klass|
        expect(described_class.resolve_type(nil, klass.new, nil).graphql_name).
          to eq(klass.name)
      end
    end

    it "raises an error for unknown type" do
      expect { described_class.resolve_type(nil, RSpec, nil) }.
        to raise_error(RuntimeError, "Unexpected object: RSpec")
    end
  end

  describe ".id_from_object" do
    it "returns the gql id for the given object" do
      client = Client.new(id: 123)
      id = described_class.id_from_object(client, Client)

      expect(Base64.decode64(id)).to eq("Client-123")
    end
  end

  describe ".object_from_id" do
    it "returns an instance of the object from the given gql id" do
      client = Client.create(valid_client_attributes)
      expect(described_class.object_from_id(client.gql_id, nil)).to eq(client)
    end
  end
end
