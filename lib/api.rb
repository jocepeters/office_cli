require_relative "../config/environment"

module EpisodeIndex


    class API

    def initialize 
        @url = "https://www.officeapi.dev/api/episodes" #instance varible
    end

    def titles
        uri = URI.parse(@url)    #Uniform Resource Identifier
        response = Net::HTTP.get(uri)

        data = JSON.parse(response)
        data["data"].each do |episode|
        Episode.new(episode)
        end
    end

   
    end

end
