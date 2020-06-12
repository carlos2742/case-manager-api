module Types
  class MutationType < Types::BaseObject
    field :create_client, mutation: Mutations::ClientMutation::CreateClient
    field :update_client, mutation: Mutations::ClientMutation::UpdateClient
    field :remove_client, mutation: Mutations::ClientMutation::RemoveClient
  end
end
