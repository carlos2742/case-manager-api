module Types
  module ModelTypes
    class ClientType < Types::BaseObject
      description "Case client"
      graphql_name "Client"
      implements GraphQL::Types::Relay::Node
      global_id_field :id

      field :email, String, null: false
      field :first_name, String, null: false
      field :last_name, String, null: false
      field :birthday, GraphQL::Types::ISO8601Date, null: true
      field :address, String, null: true
      field :phone_number, String, null: false
      field :ssn, String, null: true
      field :arn, String, null: true
      field :emergency_contact, String, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
      field :cases, [Types::ModelTypes::CaseType], null: true
    end
  end
end
