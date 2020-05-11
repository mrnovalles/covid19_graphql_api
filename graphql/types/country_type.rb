module Types
  class CountryType < GraphQL::Schema::Object
    field :name, String, null: false
    field :code, String, null: false
  end
end
