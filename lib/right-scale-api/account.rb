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
                  :servers,
                  :s3_buckets

    # Creates a Deployment
    # @param [Hash] opts deployment attributes
    # @option opts [String] :nickname The nickname of the deployment
    # @option opts [String] :description The description of the deployment
    # @option opts [String :default_ec2_availability_zone the default availability zone for the deployment e.g. us-east-1a
    # @option opts [String] :default_vpc_subnet_href
    def create_deployment opts
      Deployment.create opts.merge :account => self
    end
    
    # Creates an EC2 EBS Elastic IP
    # @param [Hash] opts ip attributes
    # @option opts [String] :nickname The nickname of the ip
    # @option opts [Fixnum] :cloud_id the cloud identifier default 1   (1 = us-east; 2 = eu; 3 = us-west, 4 = ap) 
    def create_ec2_elastic_ip opts
      Ec2ElasticIp.create opts.merge :account => self
    end
    
    # Creates an EC2 EBS Volume
    # @param [Hash] opts volume attributes
    # @option opts [String] :nickname The nickname of the volume
    # @option opts [String] :description
    # @option opts [Fixnum] :aws_size The size of the volume in gigabytes*
    # @option opts [String] :ec2_availability_zone name of the availability zone e.g. us-east-1a*
    def create_ec2_ebs_volume opts
      Ec2EbsVolume.create opts.merge :account => self
    end

    # Creates an EC2 Instance
    # @param [Hash] opts server attributes
    # @option [RightScaleAPI::ServerTemplate] opts :server_template the server template to use*
    # @option [[RightScaleAPI::Deployment] opts :deployment 
    def create_server opts
      Server.create opts.merge :account => self
    end

    # Gets an EC2 ssh key.
    # Currently you can't get a list of ssh keys through the API, so you need to get the id through the web interface.
    # https://my.rightscale.com/clouds/1/ec2_ssh_keys
    # @param id the id of the ssh key to get
    def get_ec2_ssh_key id
      Ec2SshKey.new get("/ec2_ssh_keys/#{id}").merge :id => id, :account => self
    end

    class SubResource < Base
      attr_accessor :account

      def collection_uri
        "#{account.path}/#{self.class.api_name.pluralize}"
      end
    end

  end
end
