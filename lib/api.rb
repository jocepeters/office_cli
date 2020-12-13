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
        Episode.new(episode)
            episode["title"]
            
        end
    

#         def description
#             uri = URI.parse(@url)
#         response = Net::HTTP.get(uri)
        
#         data = JSON.parse(response)
#         data["data"].map do |episode|
#         Episode.new(episode)
#             episode["description"]
#         end
    

#         def writer
#             uri = URI.parse(@url)
#         response = Net::HTTP.get(uri)
    
#         data = JSON.parse(response)
#         data["data"].map do |episode|
#         Episode.new(episode)
#             episode["writer"]
#         end
    

#        def director
#             uri = URI.parse(@url)
#         response = Net::HTTP.get(uri)
        
#         data = JSON.parse(response)
#         data["data"].map do |episode|
#         Episode.new(episode)
#             episode["director"]
#         end
    
    
#         def air_date
#             uri = URI.parse(@url)
#         response = Net::HTTP.get(uri)
    
#         data = JSON.parse(response)
#         data["data"].map do |episode|
#         Episode.new(episode)
#             episode["airDate"]
#         end
#        end
#     end
# end
# end
end
end
end

  EpisodeIndex::API.new.titles
  