module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :client, resolver: Queries::ClientQueries::Client
    field :clients, resolver: Queries::ClientQueries::Clients

    field :user, resolver: Queries::UserQueries::User
  end
end
