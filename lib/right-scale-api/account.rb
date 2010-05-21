module RightScaleAPI
  class Account < Base
    
    collection_uri "/api/acct"  
    
    def self.sub_resources *resources
      resources.each do |resource|
        module_eval %(
                      def #{resource}
                        get('/#{resource}.xml')['#{resource}'].map do |attrs|
                          #{resource.to_s.classify}.new attrs.merge(:account => self)
                        end
                      end
                      ),__FILE__, __LINE__-6
      end
    end

    sub_resources :alert_specs,
                  :deployments,
                  :ec2_ebs_volumes,
                  :ec2_ebs_snapshots,
                  :ec2_elastic_ips,
                  :ec2_security_groups,
                  :server_templates,
                  :servers

    def create_ec2_elastic_ip opts
      Ec2ElasticIp.create opts.merge :account => self
    end
    
    def create_ec2_ebs_volume opts
      Ec2EbsVolume.create opts.merge :account => self
    end

    def create_server opts
      Server.create opts.merge :account => self
    end
    def get_ec2_ssh_key id
      Ec2SshKey.new get("/ec2_ssh_keys/#{id}").merge :id => id, :account => self
    end

    class SubResource < Base
      attr_accessor :account

      def collection_uri
        account.path + "/" + self.class.api_name.pluralize
      end
    end

  end
end
