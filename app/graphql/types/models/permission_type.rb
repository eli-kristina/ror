module Types
  module Models
    class PermissionType < Types::BaseObject
      description "Permission table"
      field :id, ID, null: false
      field :name, String, null: false
    end
  end
end