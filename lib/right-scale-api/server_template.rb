module RightScaleAPI
  class ServerTemplate <  Account::SubResource
    attributes %w(
      name
      description
      multi_cloud_image_href
      parameters
      is_head_version
      version)
  end
end
