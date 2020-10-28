module Queries
  module CaseQueries
    class Case < Queries::BaseQuery
      description 'Find an case by ID'

      argument :id, ID, required: true

      type Types::ModelTypes::CaseType, null: false

      def resolve(id:)
        authorize_user
        ::Case.find(id)
      end
    end
  end
end