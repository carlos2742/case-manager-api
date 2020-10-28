module Mutations
  module UserMutation
    class RegisterUser < BaseMutation

      graphql_name "RegisterUser"

      # TODO: define return fields
      field :user, Types::ModelTypes::UserType, null: false

      # TODO: define arguments
      argument :name, String, required: true
      argument :email, String, required: true
      argument :rol, Integer, required: true
      argument :title, Integer, required: true
      argument :password, String, required: true

      def resolve(args)
        authorize_user

        user = User.create!(args)

        # current_user needs to be set so authenticationToken can be returned
        context[:current_user] = user

        MutationResult.call(
            obj: { user: user },
            success: user.persisted?,
            errors: user.errors
        )

      rescue ActiveRecord::RecordInvalid => invalid
        GraphQL::ExecutionError.new(
            "Invalid Attributes for #{invalid.record.class.name}: " \
        "#{invalid.record.errors.full_messages.join(', ')}"
        )
      end
    end
  end
end
