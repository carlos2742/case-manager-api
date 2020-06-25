require 'rails_helper'

RSpec.describe "Clients", type: :request do
  describe "GET /clients" do
    it "works! (now write some real specs)" do
      client = create_client
      graphql_query = '{clients{firstName}}'

      post graphql_path(
               format: :json,
               query: graphql_query
           )

      client_results = CaseManagerApiSchema.execute(graphql_query)
      clients = client_results.to_h['data']
      response_body = json_body['data']

      expect(clients).to eq(response_body)
      expect(clients['clients'][0]['firstName']).to eq(client.first_name)
    end
  end
end
