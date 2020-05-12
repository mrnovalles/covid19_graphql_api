class CasesSummary
  URL = "https://api.covid19api.com/summary"

  def self.all_from_file
    JSON.parse(File.read("data/summary.json"))["Countries"].map do |hsh|
      new(hsh)
    end
  end

  def self.all
    summary["Countries"].map do |hsh|
      new(hsh)
    end
  end

  def self.find_by_country(slug:)
    all.find {|case_summary| case_summary.country_slug == slug}
  end

  def self.summary
    result = RestClient.get(URL)
    JSON.parse(result)
  end

   attr_reader(
     :country_slug,
     :confirmed,
     :confirmed_today,
     :deaths,
     :deaths_today,
     :recovered,
     :recovered_today,
   )

  def initialize(hsh)
    @country_slug = hsh["Slug"]
    @confirmed = hsh["TotalConfirmed"]
    @confirmed_today = hsh["NewConfirmed"]
    @deaths = hsh["TotalDeaths"]
    @deaths_today = hsh["NewDeaths"]
    @recovered = hsh["TotalRecovered"]
    @recovered_today = hsh["NewRecovered"]
  end
end
