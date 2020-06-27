# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mutations::ClientMutation::UpdateClient do
  it "update client" do
    client = create_client
    variables = {
        id: client[:id],
        last_name: 'Rodriguez'
    }

    # signIn User
    context = signIn_user

    result = gql_query(query: mutation, variables: variables, context: context).
        to_h.deep_symbolize_keys.dig(:data, :updateClient)

    expect(result.dig(:client, :id)).to eq(client.gql_id)
    expect(result.dig(:client, :lastName)).to eq(variables[:last_name])
    expect(result[:errors]).to be_blank
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
        to eq("Argument 'id' on InputObject 'UpdateClientInput' is required. Expected type ID!")
  end

  it "raise error for user not signed" do
    client = create_client

    variables = {
        id: client[:id],
        last_name: 'Rodriguez'
    }

    result = gql_query(query: mutation, variables: variables).
        to_h.deep_symbolize_keys

    expect(result[:errors]).to_not be_blank
    expect(result.dig(:errors, 0, :message)).to eq('User not signed in')
  end

  def mutation
    <<-GQL
      mutation updateClient(
        $id: ID!  
        $last_name: String!
      ) {
        updateClient(input: {
          id: $id
          lastName: $last_name
        }) {
          client {
            id
            lastName
          }
          success
          errors
        }
      }
    GQL
  end

  def mutation_with_out_id
    <<-GQL
      mutation updateClient(
        $last_name: String!
      ) {
        updateClient(input: {
          lastName: $last_name
        }) {
          client {
            lastName
          }
          success
          errors
        }
      }
    GQL
  end
end
