module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    ## PERMISSION ##
    field :fetch_permissions, Models::PermissionType, null: true do
      description "fetch permission by ID"
      argument :id, ID, required: true
    end

    def fetch_permissions(id:)
      Permission.find(id)
    end

    ## CAT ##
    field :fetch_cats, Models::CatType, null: true do
      description "fetch cat by ID"
      argument :id, ID, required: true
    end

    def fetch_cats(id:)
      Cat.find(id)
    end

    ## ROLE ##
    field :fetch_roles, Models::RoleType, null: true do
      description "fetch role by ID"
      argument :id, ID, required: true
    end

    def fetch_roles(id:)
      Role.find(id)
    end

    ## USER ##
    field :fetch_users, Models::UserType, null: true do
      description "fetch user by ID"
      argument :id, ID, required: true
    end

    def fetch_users(id:)
      User.find(id)
    end
  end
end
