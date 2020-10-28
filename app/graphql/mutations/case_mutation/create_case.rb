module Mutations
  module CaseMutation
    class CreateCase < Mutations::BaseMutation
      # TODO: define return fields
      field :case, Types::ModelTypes::CaseType, null: false

      # TODO: define arguments
      argument :client_id, ID, required: true
      argument :user_id, ID, required: true
      argument :name, String, required: true
      argument :number, String, required: true
      argument :description, String, required: false
      argument :stage, Integer, required: false
      argument :practice_area, Integer, required: false
      argument :billing_method, Integer, required: false

      # TODO: define resolve method
      def resolve(args)
        authorize_user

        args[:client_id]= entity_id(args[:client_id], Client)
        args[:user_id] = entity_id(args[:user_id], User)

        entity = Case.create!(args)

        MutationResult.call(
            obj: { case: entity },
            success: entity.persisted?,
            errors: entity.errors
        )

      rescue ActiveRecord::RecordInvalid => invalid
        GraphQL::ExecutionError.new(
            "Invalid Attributes for #{invalid.record.class.name}: " \
        "#{invalid.record.errors.full_messages.join(', ')}"
        )
      end

      private

      def entity_id(gql_id, entity_type)
        entity = entity_type.find_by_gql_id(gql_id)
        entity.id
      end

    end
  end
end
