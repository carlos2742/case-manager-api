# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mutations::ClientMutation::RemoveClient do
  it "remove client" do
    client = create_client
    # signIn User
    context = signIn_user

    variables = {id: client.id}

    result = gql_query(query: mutation, variables: variables, context: context).
        to_h.deep_symbolize_keys.dig(:data, :removeClient)

    expect(Client.all.length).to eq(0)
    expect(result.dig(:client, :id)).to eq(client.gql_id)
    expect(result.dig(:client, :name)).to eq(variables["name"])
  end

  it "raises error for missing Argument 'id'" do
    variables = {
        last_name: 'Rodriguez'
    }

    # signIn User
    context = signIn_user

    result = gql_query(query: mutation_with_out_id, variables: variables, context: context).
        to_h.deep_symbolize_keys

    expect(result[:errors]).to_not be_blank
    expect(result.dig(:errors, 0, :message)).
        to eq("Argument 'id' on InputObject 'RemoveClientInput' is required. Expected type ID!")
  end

  it "raise error for user not signed" do
    client = create_client

    variables = {id: client.id}

    result = gql_query(query: mutation, variables: variables).
        to_h.deep_symbolize_keys

    expect(result[:errors]).to_not be_blank
    expect(result.dig(:errors, 0, :message)).to eq('User not signed in')
  end

  def mutation
    <<-GQL
      mutation removeClient(
        $id: ID!
      ) {
        removeClient(input: {
          id: $id
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

  def mutation_with_out_id
    <<-GQL
      mutation removeClient(
        $last_name: String!
      ) {
        removeClient(input:{
          lastName: $last_name
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
