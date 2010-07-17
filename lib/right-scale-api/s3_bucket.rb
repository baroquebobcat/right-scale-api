module RightScaleAPI
  class S3Bucket < Account::SubResource
    attributes %w(location)
  end
end
