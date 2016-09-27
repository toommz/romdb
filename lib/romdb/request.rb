module ROMDb
  class Request
    BASE_URL = 'https://www.omdbapi.com/?'.freeze

    def self.send_request(params)
      data = Net::HTTP.get(uri(params))
      ROMDb::Response.new(data)
    end

    def self.uri(params)
      URI("#{BASE_URL}#{params}")
    end
  end
end
