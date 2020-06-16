module Queries
  module ClientQueries
    class Client < Queries::BaseQuery
      description 'Find an client by ID'

      argument :id, ID, required: true

      type Types::ModelTypes::ClientType, null: false

      def resolve(id:)
        ::Client.find(id)
      end
    end
  end
end