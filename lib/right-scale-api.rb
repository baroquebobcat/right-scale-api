require 'yaml'
require 'httparty'
require 'active_support/core_ext'
require 'active_support/multibyte'

module RightScaleAPI
  API_VERSION = '1.0'
  BASE_URI = "https://my.rightscale.com/"

  CLOUD_REGIONS = {
    :us_east => 1,
    :eu      => 2,
    :us_west => 3,
    :ap      => 4
  }

  def self.login *args
    Client.login *args
  end
end

require File.dirname(__FILE__) + '/right-scale-api/client'
require File.dirname(__FILE__) + '/right-scale-api/base'
require File.dirname(__FILE__) + '/right-scale-api/account'

Dir[File.dirname(__FILE__) + "/right-scale-api/*.rb"].each do |src|
  require src
end
