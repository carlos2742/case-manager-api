module Mutations
  module ClientMutation
    class RemoveClient < BaseMutation
      # TODO: define return fields
      field :client, Types::ModelTypes::ClientType, null: false
      field :errors, [String], null: false

      # TODO: define arguments
      argument :id, ID, required: false

      # TODO: define resolve method
      def resolve(id:)
        client = Client.find_by_id(id)
        if client.destroy()
          {
              client: client,
              errors: []
          }
        else
          {
              client: nil,
              errors: order.errors.full_messages
          }
        end
      end
    end
  end
end
