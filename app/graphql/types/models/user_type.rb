module Types
  module Models
    class UserType < Types::BaseObject
      description "User table"
      field :id, ID, null: false
      field :usernam, String, null: false
    end
  end
end