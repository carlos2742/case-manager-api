module Queries
  module ClientQueries
    class Clients < Queries::BaseQuery
      description 'Get all clients'

      type [Types::ModelTypes::ClientType], null: false

      def resolve
        authorize_user
        ::Client.all
      end
    end
  end
end