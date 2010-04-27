module RightScaleAPI
  class ServerTemplate < Base
    attr_accessor :account

    attributes %w(nickname name description multi_cloud_image_href parameters is_head_version version)
  end
end
