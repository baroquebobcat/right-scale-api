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

    describe '.create' do
      before do
        subject.attributes []
        RightScaleAPI::Client.stub!(:post).and_return mock('httparty response', :code => 201, :headers => {}, :merge => {})
      end

      it "doesn't send invalid attrs to the object" do
        subject.should_not_receive(:new).with hash_including(:foo => 1)
        subject.should_receive(:new).twice.and_return(mock('base', :collection_uri => ''))

        subject.create :foo => 1, :id => 2
      end
    end
  end

  describe RightScaleAPI::Account do
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
