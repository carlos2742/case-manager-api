module Queries
  module ClientQueries
    class Clients < Queries::BaseQuery
      description 'Find an client by ID'

      type [Types::ModelTypes::ClientType], null: false

      def resolve()
        ::Client.all
      end
    end
  end
end