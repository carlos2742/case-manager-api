require 'rails_helper'

RSpec.describe "Clients", type: :request do
  describe "GET /clients" do
    it "works! (now write some real specs)" do
      user = sign_in_user
      client = create_client
      graphql_query = '{clients{firstName}}'

      post graphql_path(
               format: :json,
               query: graphql_query
           ), :headers => {"Authorization" => user[:authentication_token]}

      response_body = json_body['data']

      client_results = CaseManagerApiSchema.execute(graphql_query, context: {current_user: user})
      clients = client_results.to_h['data']

      expect(clients).to eq(response_body)
      expect(clients['clients'][0]['firstName']).to eq(client.first_name)
    end
  end
end
