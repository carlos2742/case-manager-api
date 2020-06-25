module Queries
  module UserQueries
    class User < Queries::BaseQuery
      description 'Find an user by ID'

      argument :id, ID, required: true

      type Types::ModelTypes::UserType, null: false

      def resolve(id:)
        ::User.find_by_gql_id(id)
      end
    end
  end
end
















