module Xmandrill  
  class API
    def initialize(key)
      @key = key
      @end_point = "https://mandrillapp.com/api/1.0/"
    end
  
    def html(path, params)
      html = File.read(path)
      Mustache.render(html, params)
    end
  
    def method_missing(method, *params)
      url = @end_point + method.to_s + "/" + params.first.to_s + ".json"
      body = params.last.is_a?(Hash) ? params.last.merge(:key => @key) : {:key => @key}
      response = HTTParty.post(url, :body => body.to_json, :headers => {"Content-Type" => "application/json"})
      
      if response.code.to_i == 200
        return "PONG!" if response.body == "\"PONG!\""
        JSON.parse(response.body)
      else
        raise(API::Error.new(JSON.parse(response.body)["code"], JSON.parse(response.body)["message"]))
      end
    end
    
    class Error < ::Exception
      def initialize(code, message)
        super "(#{code}) #{message}"
      end
    end
  end
  
end