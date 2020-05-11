class CasesSummary
  URL = "https://api.covid19api.com/summary"

  def self.find_by_country(slug:)
    country_summary = summary["Countries"].find {|data| data["Slug"] == slug}
    CasesSummary.new(country_summary)
  end

  def self.summary
    result = RestClient.get(URL)
    JSON.parse(result)
  end

   attr_reader(
     :confirmed,
     :confirmed_today,
     :deaths,
     :deaths_today,
     :recovered,
     :recovered_today,
   )

  def initialize(hsh)
    @confirmed = hsh["TotalConfirmed"]
    @confirmed_today = hsh["NewConfirmed"]
    @deaths = hsh["TotalDeaths"]
    @deaths_today = hsh["NewDeaths"]
    @recovered = hsh["TotalRecovered"]
    @recovered_today = hsh["NewRecovered"]
  end
end
