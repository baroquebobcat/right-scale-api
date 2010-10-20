require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe RightScaleAPI do
  it { should respond_to(:login) }
  
  describe RightScaleAPI::Base do
    subject { Class.new RightScaleAPI::Base }

    it { should respond_to(:collection_uri) }

    describe 'instance' do
      subject {  Class.new(RightScaleAPI::Base).new({}) }
      it { subject.should respond_to(:href) }
    end
  end

  describe RightScaleAPI::Account do
    #
    describe "#create_ec2_ebs_volume" do
      #when receive a 422
      #do stuff with error
      #missing ec2_avaliability_zone 
      # Error:Unknown availability zone '' for the cloud AWS US-East
      #missing aws_size
      #  Error:MissingParameter: The request must contain the parameter size/snapshot
    end
    describe "#create_server" do
      #@parsed_response={"errors"=>{"error"=>["Server template can't be blank", "Deployment can't be blank"]}}
    end
  end
end
