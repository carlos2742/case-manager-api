module Mutations
  module ClientMutation
    class CreateClient < Mutations::BaseMutation
      # TODO: define return fields
      field :client, Types::ModelTypes::ClientType, null: false

      # TODO: define arguments
      argument :email, String, required: true
      argument :first_name, String, required: false
      argument :last_name, String, required: false
      argument :birthday, GraphQL::Types::ISO8601Date, required: false
      argument :address, String, required: false
      argument :phone_number, String, required: true
      argument :ssn, String, required: false
      argument :arn, String, required: false
      argument :emergency_contact, String, required: true

      # TODO: define resolve method
      def resolve(args)
        # authorize_user

        client = Client.create!(args)

        MutationResult.call(
            obj: { client: client },
            success: client.persisted?,
            errors: client.errors
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
