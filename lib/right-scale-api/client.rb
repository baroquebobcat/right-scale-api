class RightScaleAPI::Client
  include HTTParty
  
  base_uri "https://my.rightscale.com/"
  headers 'X-API-Version' => "1.0"
  
  class <<self
    alias :login :basic_auth
  end
end
