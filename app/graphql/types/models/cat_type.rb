module Types
  module Models
    class CatType < Types::BaseObject
      description "Cat table"
      field :id, ID, null: false
      field :name, String, null: false
      field :life_span, String, null: false
      field :origin, String, null: false
      field :temperament, String, null: false
      field :image, String, null: false
      field :hairless, ID, null: false
      field :short_legs, ID, null: false
      field :suppressed_tail, ID, null: false
    end
  end
end