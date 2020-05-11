class QueryType < GraphQL::Schema::Object
  description "The query root of this schema"

  field :country, ::Types::CountryType, null: true do
    description "Find a country by code"
    argument :code, String, required: true
  end

  def country(code:)
    { name: "Argentina", code: "AR" }
  end
end
