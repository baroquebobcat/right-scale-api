module RightScaleAPI
  # EC2 EBS Volume
  # See http://support.rightscale.com/15-References/RightScale_API_Reference_Guide/02-Management/05-EC2_EBS_Volumes
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

    # Attaches the volume to a server
    # @param [RightScaleAPI::Server] server the server to attach the volume to
    # @param [String] device the device to mount the volume as e.g. /dev/sdk
    # @param [String] mount when to mount the device. Usually 'boot'
    def attach_to_server server, device, mount
      account.post '/component_ec2_ebs_volumes', :body => {
        :component_ec2_ebs_volume => {
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
