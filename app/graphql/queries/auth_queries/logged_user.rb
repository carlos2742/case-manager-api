module Queries
  module AuthQueries
    class LoggedUser < Queries::BaseQuery
      description 'return logged user'

      type Types::ModelTypes::UserType, null: false

      def resolve
        authorize_user
        context[:current_user]
      end
    end
  end
end
















