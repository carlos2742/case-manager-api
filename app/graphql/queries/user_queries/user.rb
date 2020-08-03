module Queries
  module UserQueries
    class User < Queries::BaseQuery
      description 'Find an user by id or email'

      argument :id, ID, required: false
      argument :email, String, required: false

      type Types::ModelTypes::UserType, null: false

      def resolve(args)
        authorize_user

        if args.include?(:id)
          ::User.find_by_gql_id(args[:id])
        elsif args.include?(:email)
          ::User.find_by_email(args[:email])
        end
      end
    end
  end
end
















