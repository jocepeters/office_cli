require_relative "../config/environment"

module EpisodeIndex


    class API

    def initialize #method
        @url = "https://www.officeapi.dev/api/episodes" #instance varible
    end

    def titles
        uri = URI.parse(@url)
        response = Net::HTTP.get(uri)

        data = JSON.parse(response)
        data["data"].map do |episode|
        Episode.new(episode)
            episode["title"]
        end
        # puts Episode
    end

    def description
        uri = URI.parse(@url)
        response = Net::HTTP.get(uri)

        data = JSON.parse(response)

        episodes = [];
        data["data"].map do |episode| episodes.push(episode) end
        return episodes

        end

    end

end
