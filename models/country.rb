module Models
  class Country
    URL = "https://api.covid19api.com/countries"

    def self.all
      countries.map do |hsh|
        Country.new(hsh).to_graphql
      end
    end

    def self.find_by(field:, value:)
      country = countries.find {|c| c[field] == value }
      Country.new(country)
    end

    def self.countries
      result = RestClient.get(URL)
      JSON.parse(result)
    end

    attr_reader :name, :code, :slug

    def initialize(hsh = {})
        @name = hsh["Country"]
        @code = hsh["ISO2"]
        @slug = hsh["Slug"]
    end
  end
end
