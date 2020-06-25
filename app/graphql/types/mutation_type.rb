module Types
  class MutationType < Types::BaseObject
    field :register_user, mutation: Mutations::UserMutation::RegisterUser
    field :sign_in, mutation: Mutations::UserMutation::SignIn
    field :sign_out, mutation: Mutations::UserMutation::SignOut

    field :create_client, mutation: Mutations::ClientMutation::CreateClient
    field :update_client, mutation: Mutations::ClientMutation::UpdateClient
    field :remove_client, mutation: Mutations::ClientMutation::RemoveClient
  end
end
