module RightScaleAPI
  class RightScaleAPI::Client
    include HTTParty
    
    base_uri BASE_URI
    headers 'X-API-Version' => API_VERSION
    
    class <<self
      alias :login :basic_auth
    end
  end
end
