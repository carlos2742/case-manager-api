# frozen_string_literal: true

require "rails_helper"

RSpec.describe Queries::AuthQueries::CurrentUser do
  it "signs in the user" do
    variables = sign_in_params

    user = User.create(same_user_attributes)

    result = gql_query(query: mutation, variables: variables).
      to_h.deep_symbolize_keys.dig(:data, :signIn)

    user.reload
    expect(result.dig(:user, :id)).to eq(user.gql_id)
    expect(result.dig(:user, :authenticationToken)).
      to eq(user.authentication_token)
    expect(result[:success]).to eq(true)
    expect(result[:errors]).to be_blank
  end

  it "raises error for incorrect email/password" do
    variables = sign_in_params

    user_variables = same_user_attributes
    user_variables['password'] = "wrongpass1"

    User.create(user_variables)

    result = gql_query(query: mutation, variables: variables).
      to_h.deep_symbolize_keys

    expect(result.dig(:errors, 0, :message)).to eq("Incorrect Email/Password")
    expect(result.dig(:data, :signIn)).to be_blank
  end

  it "raises error for missing user" do
    variables = sign_in_params

    result = gql_query(query: mutation, variables: variables).
      to_h.deep_symbolize_keys

    expect(result.dig(:errors, 0, :message)).
      to eq("User not registered on this application")
    expect(result.dig(:data, :signIn)).to be_blank
  end

  def sign_in_params
    {
        "email" => same_user_attributes['email'],
        "password" => same_user_attributes['password']
    }
  end

  def mutation
    <<-GQL
      mutation signIn($email: String!, $password: String!) {
        signIn(input: { email: $email, password: $password }) {
          user {
            id
            name
            authenticationToken
          }
          success
          errors
        }
      }
    GQL
  end
end
