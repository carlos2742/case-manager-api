module Types
  module ModelTypes
    class CaseType < Types::BaseObject
      description "Client case"
      graphql_name "Case"
      implements GraphQL::Types::Relay::Node
      global_id_field :id

      field :client, Types::ModelTypes::ClientType, null: false
      field :user, Types::ModelTypes::UserType, null: false
      field :name, String, null: false
      field :number, String, null: false
      field :description, String, null: true
      field :stage, Integer, null: true
      field :practice_area, Integer, null: true
      field :billing_method, Integer, null: true
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
