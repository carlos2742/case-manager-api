module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :client, ClientType, null: true do
      description "An example field added by the generator"
      argument :id, ID, required: true
    end
    def client(id:)
      Client.find(id)
    end
  end
end
