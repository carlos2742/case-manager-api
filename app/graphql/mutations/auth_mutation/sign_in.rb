module Mutations
  module AuthMutation
    class SignIn < BaseMutation
      graphql_name "SignIn"

      # TODO: define return fields
      field :user, Types::ModelTypes::UserType, null: false

      # TODO: define arguments
      argument :email, String, required: true
      argument :password, String, required: true

      # TODO: define resolve method
      def resolve(args)

        user = User.find_for_database_authentication(email: args[:email])

        if user.present?
          if user.valid_password?(args[:password])
            context[:current_user] = user
            MutationResult.call(obj: { user: user }, success: true)
          else
            GraphQL::ExecutionError.new("WRONG_CREDENTIALS")
          end
        else
          GraphQL::ExecutionError.new("UNREGISTERED_USER")
        end
      end
    end
  end
end
