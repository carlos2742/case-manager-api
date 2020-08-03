module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :logged_user, resolver: Queries::AuthQueries::LoggedUser

    field :client, resolver: Queries::ClientQueries::Client
    field :clients, resolver: Queries::ClientQueries::Clients

    field :user, resolver: Queries::UserQueries::User
    field :users, resolver: Queries::UserQueries::Users
  end
end
