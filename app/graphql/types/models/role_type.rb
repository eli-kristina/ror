module Types
  module Models
    class RoleType < Types::BaseObject
      description "Role table"
      field :id, ID, null: false
      field :name, String, null: false
    end
  end
end