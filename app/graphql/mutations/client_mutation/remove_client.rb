module Mutations
  module ClientMutation
    class RemoveClient < BaseMutation
      # TODO: define return fields
      field :client, Types::ModelTypes::ClientType, null: false

      # TODO: define arguments
      argument :id, ID, required: false

      # TODO: define resolve method
      def resolve(id:)
        authorize_user

        client = Client.find_by_id(id)

        MutationResult.call(
            obj: { client: client },
            success: client.persisted?,
            errors: client.errors
        )
      end
    end
  end
end
