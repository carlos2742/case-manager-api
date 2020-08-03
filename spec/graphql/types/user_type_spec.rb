# frozen_string_literal: true

require "rails_helper"

RSpec.describe Types::ModelTypes::UserType do
  it "returns the auth token if current user" do
    user = User.create(valid_user_attributes)
    variables = { "id" => user.gql_id }

    result = gql_query(
      query: query, variables: variables, context: { current_user: user }
    ).to_h.deep_symbolize_keys

    expect(result.dig(:data, :user, :id)).to eq(user.gql_id)
    expect(result.dig(:data, :user, :authenticationToken)).to eq(user.authentication_token)
    expect(result[:errors]).to be_blank
  end

  it "does not return the authenticationToken for non current user" do
    user = User.create(valid_user_attributes)
    variables = { "id" => user.gql_id }

    result = gql_query(query: query, variables: variables).
      to_h.deep_symbolize_keys

    expect(result.dig(:data, :user, :authenticationToken)).to be_nil
  end

  def query
    <<-GQL
      query getUser($id: ID!){
        user(id: $id) {
          id
          name
          authenticationToken
        }
      }
    GQL
  end
end
