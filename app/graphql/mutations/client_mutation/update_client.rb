module Mutations
  module ClientMutation
    class UpdateClient < BaseMutation
      # TODO: define return fields
      field :client, Types::ModelTypes::ClientType, null: false

      # TODO: define arguments
      argument :id, ID, required: true
      argument :email, String, required: false
      argument :first_name, String, required: false
      argument :last_name, String, required: false
      argument :birthday, GraphQL::Types::ISO8601Date, required: false
      argument :address, String, required: false
      argument :phone_number, String, required: false
      argument :ssn, String, required: false
      argument :arn, String, required: false
      argument :emergency_contact, String, required: false

      # TODO: define resolve method
      def resolve(args)
        authorize_user

        client = Client.find_by_gql_id(args[:id])
        client.update(args.except(:id))

        MutationResult.call(
            obj: { client: client },
            success: client.persisted?,
            errors: client.errors
        )
      end
    end
  end
end
