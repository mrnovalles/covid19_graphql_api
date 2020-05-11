module Models
  class Country

    def self.all
      countries = request
      countries.map do |hsh|
        Country.new(hsh).to_graphql
      end
    end

    def self.find_by(field:, value:)
      country = country_data.find {|c| c[filter] == value }
      Country.new(country)
    end

    def self.to_graphql(country)
      return {} unless country

      {
        name: country["Country"],
        code: country["ISO2"],
        slug: country["Slug"]
      }
    end

    def self.request
      url = 'https://api.covid19api.com/countries'
      result = RestClient.get(url)
      JSON.parse(result)
    end

    def initialize(hsh = {})
        @name = hsh["Country"]
        @code = hsh["ISO2"]
        @slug = hsh["Slug"]
    end

    def to_graphql
      return {} unless @name

      {
        name: @name,
        code: @code,
        slug: @slug
      }
    end



  end
end
