module Queries
  module ClientQueries
    class Clients < Queries::BaseQuery
      description 'Get all clients'

      type [Types::ModelTypes::ClientType], null: true

      argument :name, String, required: false

      def resolve(**args)
        authorize_user
        clients = ::Client.all
        clients = clients.find_by_name(args[:name]) if args && args[:name]
        clients
      end
    end
  end
end