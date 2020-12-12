require_relative "../config/environment"

module EpisodeIndex
   
  
    class API
      def initialize
        @url = "https://www.officeapi.dev/api/episodes?limit=400"
      end
  
      def titles
        uri = URI.parse(@url)
        response = Net::HTTP.get(uri)
        
        data = JSON.parse(response)
        data["data"].map do |episode|
        Episode.new(data)
            episode["title"]
        end
      end
    end
  end

  EpisodeIndex::API.new.titles
