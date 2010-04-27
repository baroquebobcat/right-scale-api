module RightScaleAPI
  class Deployment < Base
    attributes %w(
      nickname
      description
      servers
      parameters
      default_vpc_subnet_href
      default_ec2_availability_zone
      updated_at
      created_at
    )

    attr_accessor :account

    def start_all
      post '/start_all'
    end

    def stop_all
      post '/stop_all'
    end

    def duplicate
      post '/duplicate'
    end

  end
end
