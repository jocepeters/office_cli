
class API

    def initialize
        @url = "https://www.officeapi.dev/api/episodes/"
    end

    def fetch_office_net_http
        uri = URI(@url)
        response = Net::HTTP.get(uri)
        data = JSON.parse(response)
    end
 
end

API.new.fetch_office_net_http