module RightScaleAPI
  # EC2 SSH key
  # http://support.rightscale.com/15-References/RightScale_API_Reference_Guide/02-Management/08-EC2_SSH_Keys
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
