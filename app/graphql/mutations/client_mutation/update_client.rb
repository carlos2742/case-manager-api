module Mutations
  module ClientMutation
    class UpdateClient < BaseMutation
      # TODO: define return fields
      field :client, Types::ModelTypes::ClientType, null: false
      field :errors, [String], null: false

      # TODO: define arguments
      argument :id, ID, required: false
      argument :name, String, required: false
      argument :last_name, String, required: false
      argument :birthday, GraphQL::Types::ISO8601Date, required: false
      argument :address, String, required: false
      argument :phone_number, String, required: false
      argument :ssn, String, required: false
      argument :arn, String, required: false
      argument :emergency_contact, String, required: false

      # TODO: define resolve method
      def resolve(id:, name:,last_name:,birthday:,address:, phone_number:, ssn:, arn:, emergency_contact:)
        client = Client.find_by_id(id)
        if client.update(name: name,last_name: last_name,birthday: birthday,address: address, phone_number: phone_number, ssn: ssn, arn: arn, emergency_contact: emergency_contact)
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
