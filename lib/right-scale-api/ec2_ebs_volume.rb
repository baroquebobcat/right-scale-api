module RightScaleAPI
class Ec2EbsVolume < Account::SubResource

   attributes %w(
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
     account.post '/component_ec2_ebs_volumes', :body => {
       :component_ec2_ebs_volumes => {
         :ec2_ebs_volume_href => uri,
         :component_href => server.href,
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
