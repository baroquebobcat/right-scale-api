require 'yaml'
require 'httparty'
require 'active_support/core_ext'

module RightScaleAPI
end

require File.dirname(__FILE__) + '/right-scale-api/base'
require File.dirname(__FILE__) + '/right-scale-api/account'

Dir[File.dirname(__FILE__) + "/right-scale-api/*.rb"].each do |src|
  require src
end
