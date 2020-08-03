class CaseManagerApiSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  # Opt in to the new runtime (default in future graphql-ruby versions)
  use GraphQL::Execution::Interpreter
  use GraphQL::Analysis::AST

  # Add built-in connections for pagination
  use GraphQL::Pagination::Connections

  # You'll also need to define `resolve_type` for
  # telling the schema what type Relay `Node` objects are
  def self.resolve_type(_type, obj, _ctx)
    "Types::ModelTypes::#{obj.class.name}Type".constantize
  rescue NameError
    raise("Unexpected object: #{obj}")
  end

  def self.id_from_object(object, type_definition, _ctx = nil)
    GraphQL::Schema::UniqueWithinType.encode(type_definition.name, object.id)
  end

  def self.object_from_id(id, _ctx)
    type_name, object_id = GraphQL::Schema::UniqueWithinType.decode(id)

    # Now, based on `type_name` and `id`
    # find an object in your application
    # This will give the user access to all records in your db
    # so you might want to restrict this properly
    Object.const_get(type_name).find(object_id)
  end
end
