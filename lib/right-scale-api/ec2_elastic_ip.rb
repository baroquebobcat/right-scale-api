module RightScaleAPI
  class Ec2ElasticIp < Account::SubResource
    attributes %w(
      ec2_instance_id
      public_ip
      cloud_id
      server_href
      )
  end 
end
