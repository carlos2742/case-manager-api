module Types
  module ModelTypes
    class UserType < Types::BaseObject
      description "App user"
      graphql_name "User"
      implements GraphQL::Types::Relay::Node
      global_id_field :id

      field :email, String, null: false
      field :encrypted_password, String, null: false
      field :reset_password_token, String, null: true
      field :reset_password_sent_at, GraphQL::Types::ISO8601DateTime, null: true
      field :remember_created_at, GraphQL::Types::ISO8601DateTime, null: true
      field :name, String, null: true
      field :rol, Integer, null: true
      field :title, Integer, null: true
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
      field :authentication_token, String, null: true
      field :authentication_token_created_at, GraphQL::Types::ISO8601DateTime, null: true
      field :cases, [Types::ModelTypes::CaseType], null: true

      def authentication_token
        if object.gql_id != context[:current_user]&.gql_id
          raise GraphQL::UnauthorizedFieldError,
                "Unable to access authentication_token"
        end
        object.authentication_token
      end

    end
  end
end
