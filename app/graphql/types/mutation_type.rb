module Types
  class MutationType < Types::BaseObject
    field :sign_in, mutation: Mutations::AuthMutation::SignIn
    field :sign_out, mutation: Mutations::AuthMutation::SignOut

    field :register_user, mutation: Mutations::UserMutation::RegisterUser
    field :remove_user, mutation: Mutations::UserMutation::RemoveUser
    field :update_user, mutation: Mutations::UserMutation::UpdateUser

    field :create_client, mutation: Mutations::ClientMutation::CreateClient
    field :update_client, mutation: Mutations::ClientMutation::UpdateClient
    field :remove_client, mutation: Mutations::ClientMutation::RemoveClient
  end
end
