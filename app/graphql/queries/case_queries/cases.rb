module Queries
  module CaseQueries
    class Cases < Queries::BaseQuery
      description 'Get all cases'

      type [Types::ModelTypes::CaseType], null: false

      def resolve
        authorize_user
        ::Case.all
      end
    end
  end
end