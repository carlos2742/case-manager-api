module Mutations
  module UserMutation
    class RemoveUser < BaseMutation
      # TODO: define return fields
      field :user, Types::ModelTypes::UserType, null: false

      # TODO: define arguments
      argument :id, ID, required: true

      # TODO: define resolve method
      def resolve(id:)
        authorize_user

        entity = User.find_by_gql_id(id)
        entity.destroy

        MutationResult.call(
            obj: { user: entity },
            success: entity.persisted?,
            errors: entity.errors
        )
      end
    end
  end
end
