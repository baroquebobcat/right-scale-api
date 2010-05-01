module RightScaleAPI
 class Ec2EbsSnapshot < Account::SubResource
   attributes %w(
      description
      ec2_ebs_volume_id
      commit_state
   )
 end
end
