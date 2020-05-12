require_relative "query_type"

class Schema < GraphQL::Schema
  lazy_resolve(LazyCasesSummaryFinder, :cases_summary)
  query QueryType
end
