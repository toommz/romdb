module ROMDb
  class Response
    def initialize(data)
      @json = JSON.parse(data)
                  .map { |k, v| [k.downcase, v] }.to_h
    end

    def method_missing(name)
      @json[name.to_s] || super
    end
  end
end
