module Models
  class Country
    def self.get(filter:, value:)
      url = 'https://api.covid19api.com/countries'
      result = RestClient.get(url)
      country_data = JSON.parse(result)
      country = country_data.find {|c| c[filter] == value }
      to_graphql(country)
    end

    def self.to_graphql(country)
      return {} unless country

      {
        name: country["Country"],
        code: country["ISO2"],
        slug: country["Slug"]
      }
    end

  end
end
