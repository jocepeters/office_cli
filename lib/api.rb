require_relative "../config/environment"

class EpisodeIndex::API
    attr_reader :uri


    def initialize
        @url = "https://www.officeapi.dev/api/episodes?limit=400"
        @uri = URI.parse(@url)
        end


    def get_episode_data
        uri = URI.parse(@url)
        response = Net::HTTP.get_response(uri)
        data = JSON.parse(response.body)
        data["data"].each do |episode|
            get_episode_title(episode["title"])
        end
    end

    def get_episode_title(title)
        uri = URI.parse(title)
        response = Net::HTTP.get_response(title)
        data = JSON.parse(response)
    end

    EpisodeIndex::API.new.get_episode_data

end

 
