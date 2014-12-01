module Triforce
  class Giantbomb

    BASE_URI = "http://www.giantbomb.com/api"

    attr_accessor :api_key

    def agent
      @agent ||= Mechanize.new
    end

    # http://www.giantbomb.com/api/platforms/?format=json&api_key=9a960239ddc392c376b30d73c59c5bbedce9a732
    def req resource, params = {}
      url = "#{BASE_URI}/#{resource}/?format=json&api_key=#{api_key}&#{params.to_query}"
      agent.get(url)
    end

    def platforms
      req("platforms")
    end

  end
end