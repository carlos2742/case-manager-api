module Mutations
  module ClientMutation
    class RemoveClient < BaseMutation
      # TODO: define return fields
      field :client, Types::ModelTypes::ClientType, null: false

      # TODO: define arguments
      argument :id, ID, required: true

      # TODO: define resolve method
      def resolve(id:)
        authorize_user

        entity = Client.find_by_gql_id(id)
        entity.destroy

        MutationResult.call(
            obj: { client: entity },
            success: entity.persisted?,
            errors: entity.errors
        )
      end
    end
  end
end
