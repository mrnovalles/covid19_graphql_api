module Types
  class CasesSummaryType < GraphQL::Schema::Object
    field :confirmed, Int, null: true
    field :confirmedToday, Int, null: true
    field :deaths, Int, null: true
    field :deathsToday, Int, null: true
    field :recovered, Int, null: true
    field :recoveredToday, Int, null: true
  end
end
