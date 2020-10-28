module Mutations
  module CaseMutation
    class RemoveCase < BaseMutation
      # TODO: define return fields
      field :case, Types::ModelTypes::CaseType, null: false

      # TODO: define arguments
      argument :id, ID, required: true

      # TODO: define resolve method
      def resolve(id:)
        authorize_user

        entity = Case.find_by_gql_id(id)
        entity.destroy

        MutationResult.call(
            obj: { case: entity },
            success: entity.persisted?,
            errors: entity.errors
        )
      end
    end
  end
end
