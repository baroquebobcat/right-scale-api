require 'yaml'
require 'httparty'
require 'active_support/core_ext'

module RightScaleAPI
end

require File.dirname(__FILE__) + '/right_scale_api/base'

Dir[File.dirname(__FILE__) + "/right_scale_api/*.rb"].each do |src|
  require src
end
