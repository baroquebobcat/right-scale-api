module RightScaleAPI
  class Ec2ElasticIp < Account::SubResource
    attributes %w(
      ec2_instance_id
      public_ip
      server_href
      instance_href
      )
  end 
end
