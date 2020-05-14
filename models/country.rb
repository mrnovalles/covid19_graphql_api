module Models
  class Country
    URL = "https://api.covid19api.com/summary"

    def self.all_from_file
      countries_from_file.map do |hsh|
        Country.new(hsh)
      end
    end

    def self.all
      countries.map do |hsh|
        Country.new(hsh)
      end
    rescue Exception
      all_from_file
    end

    def self.find_by(options)
      raise unless options.size == 1

      all.find {|_country| _country.send(options.keys.first) == options.values.first }
    end

    def self.countries
      result = RestClient.get(URL)
      JSON.parse(result)["Countries"]
    end

    def self.countries_from_file
      JSON.parse(File.read("data/summary.json"))["Countries"]
    end

    attr_reader :name, :code, :slug

    def initialize(hsh = {})
      @name = hsh["Country"]
      @code = hsh["CountryCode"]
      @slug = hsh["Slug"]
    end
  end
end
