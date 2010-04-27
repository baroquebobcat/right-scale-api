module RightScaleAPI
class Ec2EbsVolume < Base
   attr_accessor :account

   attributes %w(
      nickname
      description
      ec2_availability_zone
      aws_attached_at
      aws_attachment_status
      aws_device
      aws_id
      aws_size
      aws_status
      created_at
   )

   def attach_to_server server, device, mount
     account.post '/component_ec2_ebs_volumes', :query => {
       :component_ec2_ebs_volumes => {
         :ec2_ebs_volume_href => uri,
         :device => device,
         :mount => mount
       }
     }
   end

   def collection_uri
     account.path + "/ec2_ebs_volumes"
   end
 end
end
