module Queries
  class BaseQuery < GraphQL::Schema::Resolver

    def authorize_user
      return true if context[:current_user].present?
      raise GraphQL::ExecutionError, "User not signed in"
    end
  end
end