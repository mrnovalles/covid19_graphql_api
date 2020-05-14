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

  field :countries, [::Types::CountryType], null: false

  def country_by_code(code:)
    Models::Country.find_by(code: code)
  end

  def country_by_slug(slug:)
    Models::Country.find_by(slug: slug)
  end

  def countries
    Models::Country.all_from_file
  end
end
