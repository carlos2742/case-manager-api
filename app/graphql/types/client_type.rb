module Types
  class ClientType < Types::BaseObject
    description "A case client"
    field :id, ID, null: false
    field :name, String, null: true
    field :last_name, String, null: true
    field :birthday, GraphQL::Types::ISO8601Date, null: true
    field :address, String, null: true
    field :phone_number, String, null: true
    field :ssn, String, null: true
    field :arn, String, null: true
    field :emergency_contact, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
