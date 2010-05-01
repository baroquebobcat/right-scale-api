module RightScaleAPI
  class Ec2SshKey <  Account::SubResource
    attributes %w(
      aws_key_name
      aws_fingerprint
      aws_material
      ec2_ssh_key)
    
    def href
      uri
    end
  end
end
