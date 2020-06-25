module Mutations
  module UserMutation
    class SignOut < BaseMutation
      graphql_name "SignOut"

      # TODO: define return fields
      field :user, Types::ModelTypes::UserType, null: false

      # TODO: define arguments
      # argument :name, String, required: true

      # TODO: define resolve method
      def resolve
        user = context[:current_user]
        if user.present?
          success = user.reset_authentication_token!

          MutationResult.call(
              obj: { user: user },
              success: success,
              errors: user.errors
          )
        else
          GraphQL::ExecutionError.new("User not signed in")
        end
      end
    end
  end
end
