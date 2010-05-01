module RightScaleAPI
  class Ec2SecurityGroup <  Account::SubResource
    attributes %w(
      aws_description
      aws_group_name
      aws_perms
      owner
      group
      cidr_ips
      protocol
      from_port
      to_port)
  end
end
