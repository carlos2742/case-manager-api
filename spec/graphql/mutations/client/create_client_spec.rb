# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mutations::ClientMutation::CreateClient do
  it "create client" do
    variables = valid_client_attributes

    result = gql_query(query: mutation, variables: variables).
      to_h.deep_symbolize_keys.dig(:data, :createClient)

    client = Client.first
    expect(result.dig(:client, :id)).to eq(client.gql_id)
    expect(result.dig(:client, :name)).to eq(variables["name"])
    expect(result.dig(:client, :phone_number)).to eq(variables["phoneNumber"])
    expect(result[:errors]).to be_blank
  end

  it "raises error for RecordInvalid" do
    variables = valid_client_attributes

    client = Client.new
    client.validate # missing fields makes this invalid
    allow(Client).to receive(:create!).
        and_raise(ActiveRecord::RecordInvalid.new(client))

    result = gql_query(query: mutation, variables: variables).
      to_h.deep_symbolize_keys

    expect(result[:errors]).to_not be_blank
    expect(result.dig(:errors, 0, :message)).
      to include(client.errors.full_messages.first)
  end

  def mutation
    <<-GQL
      mutation createClient(
        $email: String!
        $first_name: String!
        $last_name: String!
        $birthday: ISO8601Date!
        $address: String!
        $phone_number: String!
        $ssn: String!
        $arn: String!
        $emergency_contact: String!,
      ) {
        createClient(input: {
          email: $email
          firstName: $first_name
          lastName: $last_name
          birthday: $birthday
          address: $address
          phoneNumber: $phone_number
          ssn: $ssn
          arn: $arn
          emergencyContact: $emergency_contact
        }) {
          client {
            id
            firstName
            phoneNumber
          }
          success
          errors
        }
      }
    GQL
  end
end
