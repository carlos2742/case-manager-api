# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mutations::UserMutation::RegisterUser do
  it "registers the user" do
    # signIn User
    context = signIn_user

    variables = valid_user_attributes

    result = gql_query(query: mutation, variables: variables, context: context).
      to_h.deep_symbolize_keys.dig(:data, :registerUser)

    user = User.last
    expect(result.dig(:user, :id)).to eq(user.gql_id)
    expect(result.dig(:user, :name)).to eq(variables["name"])
    expect(result.dig(:user, :email)).to eq(variables["email"])
    expect(result[:errors]).to be_blank
  end

  it "raises error for RecordInvalid" do
    # signIn User
    context = signIn_user

    variables = valid_user_attributes

    user = User.new
    user.validate # missing fields makes this invalid
    allow(User).to receive(:create!).
        and_raise(ActiveRecord::RecordInvalid.new(user))

    result = gql_query(query: mutation, variables: variables, context: context).
      to_h.deep_symbolize_keys

    expect(result[:errors]).to_not be_blank
    expect(result.dig(:errors, 0, :message)).
      to include(user.errors.full_messages.first)
  end

  def mutation
    <<-GQL
      mutation registerUser(
        $name: String!,
        $email: String!,
        $rol: Int!,
        $password: String!,
      ) {
        registerUser(input: {
          name: $name,
          email: $email,
          rol: $rol,
          password: $password,
        }) {
          user {
            id
            name
            email
            authenticationToken
          }
          success
          errors
        }
      }
    GQL
  end
end
