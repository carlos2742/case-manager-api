module Queries
  module UserQueries
    class Users < Queries::BaseQuery
      description 'Get all users'

      type [Types::ModelTypes::UserType], null: false

      def resolve
        authorize_user
        ::User.all
      end
    end
  end
end
















