module ROMDb
  class Search
    RESPONSE_TYPES = [:json, :xml].freeze
    TYPES          = [:movie, :serie, :episode].freeze
    PLOTS          = [:short, :full].freeze

    def initialize
      @request = ''
    end

    def search
      sanitize_request
      ROMDb::Request.send_request(@request)
    end

    def where(params)
      params.each do |param, value|
        send(param, value)
      end

      self
    end

    def title(title)
      append_to_request('t', title)
      self
    end

    def year(year)
      append_to_request('y', year)
      self
    end

    def type(type)
      append_to_request('type', type)
      self
    end

    def plot(plot)
      append_to_request('plot', plot)
      self
    end

    def response_type(response_type)
      append_to_request('r', response_type)
      self
    end

    def tomatoes(tomatoes)
      append_to_request('tomatoes', tomatoes)
      self
    end

    private

    def append_to_request(param, string)
      @request += "#{param}=#{CGI.escape(string)}&"
    end

    def sanitize_request
      @request.gsub(/\&$/, '')
    end
  end
end
