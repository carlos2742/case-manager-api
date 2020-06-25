require 'rails_helper'

RSpec.describe "Graphqls", type: :request do
  it "executes the given query or mutation" do
    stub_schema_execute

    variables = { "myVariables" => "test" }
    query = "someLongQuery(input: { id: ID } { users { id name } })"
    operation_name = "signIn"

    post graphql_path(
             format: :json,
             variables: variables.to_json,
             query: query,
             operationName: operation_name
         )

    expect(CaseManagerApiSchema).to have_received(:execute).with(
        query,
        variables: variables,
        context: { current_user: nil },
        operation_name: operation_name
    )
    expect(json_body).to eq("success" => true)
  end

  it "sets the current_user context" do
    stub_schema_execute
    user = sign_in_user

    post graphql_path(format: :json)

    expect(CaseManagerApiSchema).to have_received(:execute).with(
        nil,
        variables: {},
        context: { current_user: user },
        operation_name: nil
    )
    expect(json_body).to eq("success" => true)
  end
end
