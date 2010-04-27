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
                      )
      end
    end

    sub_resources :servers, :deployments, :alert_specs, :ec2_ebs_volumes, :ec2_elastic_ips, :server_templates

    def create_ec2_elastic_ip opts
      Ec2ElasticIp.create opts.merge :account => self
    end

    def get_ec2_ssh_key id
      Ec2SshKey.new get "/ec2_ssh_keys/#{id}"
    end

    class SubResource < Base
      attr_accessor :account

      def collection_uri
        account.path + "/" + self.class.api_name.pluralize
      end
    end

  end
end
