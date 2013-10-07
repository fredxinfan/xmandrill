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
  
    def method_missing(method, params = {})
      url = @end_point + method.to_s.gsub("_","/") + ".json"
      response = HTTParty.post(url, :body => params.merge(:key => @key).to_json, :headers => {"Content-Type" => "application/json"})
      
      if response.code.to_i == 200
        JSON.parse(response.body)
      else
        raise(API::Error.new(JSON.parse(response.body)["code"], JSON.parse(response.body)["message"]))
      end
    end
    
    class Error < ::Exception
      def initialize(code, message)
        "(#{code}) #{message}"
      end
    end
  end
  
end