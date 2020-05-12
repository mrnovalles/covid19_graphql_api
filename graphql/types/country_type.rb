require_relative "cases_summary_type"

module Types
  class CountryType < GraphQL::Schema::Object
    field :name, String, null: false
    field :slug, String, null: false
    field :code, String, null: false
    field :casesSummary, Types::CasesSummaryType, null: true

    def cases_summary
      # CasesSummary.find_by_country(slug: object.slug)
      LazyCasesSummaryFinder.new(context, object.slug)
    end
  end
end
