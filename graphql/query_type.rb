class QueryType < GraphQL::Schema::Object
  description "The query root of this schema"

  field :countryByCode, ::Types::CountryType, null: true do
    description "Find a country by code"
    argument :code, String, required: true
  end

  field :countryBySlug, ::Types::CountryType, null: true do
    description "Find a country by slug"
    argument :slug, String, required: true
  end

  def country_by_code(code:)
    Models::Country.get(filter: "ISO2", value: code)
  end

  def country_by_slug(slug:)
    Models::Country.get(filter: "Slug", value: slug)
  end
end
