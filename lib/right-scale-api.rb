require 'yaml'
require 'httparty'
require 'active_support/core_ext'

module RightScaleAPI
  API_VERSION = '1.0'
  BASE_URI = "https://my.rightscale.com/"
end

require File.dirname(__FILE__) + '/right-scale-api/client'
require File.dirname(__FILE__) + '/right-scale-api/base'
require File.dirname(__FILE__) + '/right-scale-api/account'

Dir[File.dirname(__FILE__) + "/right-scale-api/*.rb"].each do |src|
  require src
end
