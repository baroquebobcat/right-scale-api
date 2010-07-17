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
  end
end
