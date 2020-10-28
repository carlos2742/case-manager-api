module Mutations
  module CaseMutation
    class UpdateCase < BaseMutation
      # TODO: define return fields
      field :case, Types::ModelTypes::CaseType, null: false

      # TODO: define arguments
      argument :id, ID, required: true
      argument :client_id, ID, required: true
      argument :name, String, required: true
      argument :number, String, required: false
      argument :description, String, required: false
      argument :stage, Integer, required: false
      argument :practice_area, Integer, required: false
      argument :billing_method, Integer, required: false

      # TODO: define resolve method
      def resolve(args)
        authorize_user

        args[:client_id] = Client.find_by_gql_id(args[:client_id]).id
        entity = Case.find_by_gql_id(args[:id])
        entity.update(args.except(:id))

        MutationResult.call(
            obj: { case: entity },
            success: entity.persisted?,
            errors: entity.errors
        )
      end
    end
  end
end
