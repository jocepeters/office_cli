require_relative "../config/environment"

class EpisodeIndex::API

    def initialize
        @url = "https://www.officeapi.dev/api/episodes"
    end

    def get_episode_data(url)
        uri = URI.parse(@url)
        response = Net::HTTP.get(uri)
        data = JSON.parse(response)
        EpisodeIndex::Episode.new(data)
    end

end

 
