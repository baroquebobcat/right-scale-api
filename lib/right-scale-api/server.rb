module RightScaleAPI
  class Server < Account::SubResource
    attributes %w(
      aki_image_href
      ari_image_href
      associate_eip_at_launch
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

    SETTINGS = %w(
      ec2_ssh_key_href
      ec2_security_groups_href
      ec2_instance_type
      aki_image_href
      ari_image_href
      ec2_image_href
      vpc_subnet_href
      pricing
      max_spot_price
      locked
      ec2_availability_zone
      aws_platform
      dns_name
      private_dns_name
      ip_address
      private_ip_address
      aws_id
      cloud_id
      aws_product_codes
)

    SETTINGS.each do |name|
      module_eval <<-END,__FILE__, __LINE__+1
        def #{name}
          @#{name} ||= settings["#{name}"]
        end
      END
    end
    
    #returns the cloud region the server is in (:us_east,:us_west,:eu,:ap)
    def region
      RightScaleAPI::CLOUD_REGIONS.find{|k,v|v == cloud_id}.first
    end

    # Starts the server
    def start
      post '/start'
    end
    
    # Stops the server
    def stop
      post '/stop'
    end
    
    # Reboots the server
    def reboot
      post '/reboot'
    end
    
    # Server Settings
    # for info: under Sub-resources on
    # http://support.rightscale.com/15-References/RightScale_API_Reference_Guide/02-Management/02-Servers
    def settings
      @settings ||= get('/settings')['settings']
    end

    def reset_settings
      @settings = nil
    end

    def reload_settings
      reset_settings
      settings
    end

    # Is the server operational
    def operational?
      state == 'operational'
    end
    
    alias :running? :operational?

    # Attach a volume to the server
    # @param [RightScaleAPI::Ec2EbsVolume] volume the volume to attach
    # @param [String] device the device to attach it as e.g. /dev/sdk
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

    # creates a blank volume and attaches it to the server
    # @param [Hash] opts Account#create_ec2_ebs_volume's opts +
    # @option opts [String] :device device mount point, e.g. /dev/sdk
    # @option opts [String] :ec2_availability_zone (server's) availability zone to create the volume in.

    def attach_blank_volume opts
      device = opts.delete :device
      opts = {:ec2_availability_zone => ec2_availability_zone }.merge opts #default to the server's avail zone
      volume = account.create_ec2_ebs_volume opts
      attach_volume volume, device
    end

    def self.opts_to_query_opts opts
      assoc_ip = opts.delete :associate_eip_at_launch
      if !assoc_ip.nil?
        opts[:associate_eip_at_launch] = assoc_ip ? 1 : 0
      end
      super opts
    end

  end
end
