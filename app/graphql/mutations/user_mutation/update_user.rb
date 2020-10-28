module Mutations
  module UserMutation
    class UpdateUser < BaseMutation
      # TODO: define return fields
      field :user, Types::ModelTypes::UserType, null: false

      # TODO: define arguments
      argument :id, ID, required: true
      argument :email, String, required: false
      argument :name, String, required: false
      argument :password, String, required: false
      argument :rol, Integer, required: false
      argument :title, Integer, required: false

      # TODO: define resolve method
      def resolve(args)
        authorize_user

        entity = User.find_by_gql_id(args[:id])
        entity.update(args.except(:id))

        MutationResult.call(
            obj: { user: entity },
            success: entity.persisted?,
            errors: entity.errors
        )
      end
    end
  end
end
