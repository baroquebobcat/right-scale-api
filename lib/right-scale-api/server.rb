module RightScaleAPI
  class Server < Account::SubResource
    attributes %w(
      server_template_href
      server_type
      created_at
      nickname
      updated_at tags
      type
      deployment_href
      current_instance_href
      state
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
      post '/attach_volume', :query => {
        :server => {
          :ec2_ebs_volume_href => volume.uri,
          :device => device
        }
      }
    end
  end
end
