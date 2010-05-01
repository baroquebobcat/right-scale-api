module RightScaleAPI
  class Server < Account::SubResource
    attributes %w(
      aki_image_href
      ari_image_href
      associate_eip_at_launch
      cloud_id
      current_instance_href
      deployment_href
      ec2_availability_zone
      ec2_elastic_ip_href
      ec2_image_href
      ec2_security_groups_href
      ec2_ssh_key_href
      ec2_user_data
      instance_type
      nickname
      parameters
      server_template_href
      server_type
      state
      type
      vpc_subnet_href
    )
        
    def start
      post '/start'
    end
    
    def stop
      post '/stop'
    end
    
    def reboot
      post '/reboot'
    end
    
    def settings
      get('/settings')['settings']
    end

    def attach_volume volume, device
      if running?
        post '/attach_volume', :query => {
          :server => {
            :ec2_ebs_volume_href => volume.uri,
            :device => device
          }
        }
      else
        volume.attach_to_server self, device, 'boot'
      end
    end

    # Account#create_ec2_ebs_volume's opts +
    # :device -- device mount point, eg /dev/sdk
    def attach_blank_volume opts
      device = opts.delete :device
      opts = {:ec2_availability_zone => 'us-east-1a'}.merge opts #default to the server's avail zone
      volume = account.create_ec2_ebs_volume opts
      attach_volume volume, device
    end
  end
end
