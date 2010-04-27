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

    sub_resources :servers, :deployments, :alert_specs, :ec2_ebs_volumes, :server_templates

    def create_ec2_elastic_ip opts
      Ec2ElasticIp.create opts.merge :account => self
    end
  end
end
