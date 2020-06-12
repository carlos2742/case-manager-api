module Mutations
  module ClientMutation
    class CreateClient < Mutations::BaseMutation
      # TODO: define return fields
      field :client, Types::ModelTypes::ClientType, null: false
      field :errors, [String], null: false

      # TODO: define arguments
      argument :name, String, required: true
      argument :last_name, String, required: true
      argument :birthday, GraphQL::Types::ISO8601Date, required: true
      argument :address, String, required: true
      argument :phone_number, String, required: true
      argument :ssn, String, required: true
      argument :arn, String, required: true
      argument :emergency_contact, String, required: true

      # TODO: define resolve method
      def resolve(name:,last_name:,birthday:,address:, phone_number:, ssn:, arn:, emergency_contact:)
        client = Client.new(name: name,last_name: last_name,birthday: birthday,address: address, phone_number: phone_number, ssn: ssn, arn: arn, emergency_contact: emergency_contact)
        if client.save
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
