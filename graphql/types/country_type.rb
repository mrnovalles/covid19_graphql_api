require_relative "cases_summary_type"

module Types
  class CountryType < GraphQL::Schema::Object
    field :name, String, null: false
    field :slug, String, null: false
    field :code, String, null: false
    field :casesSummary, Types::CasesSummaryType, null: true

    # TODO: Add a lazy-loader, imagine asking for this field in `countries` query
    def cases_summary
      CasesSummary.find_by_country(slug: object.slug)
    end
  end
end
