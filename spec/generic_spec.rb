require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Generic" do
	before do

		@client=Plivo.authenticate 'some_id','some_token'
	end
	it "should set auth_id and auth_ token " do
		@client.should_not be_instance_of(NilClass)
	end

	it "should set api_extension" do
		@client::Call.instance_variable_get(:@api_extension).should=="/Call"
	end

	it "should create a sub extension" do
		@client::SubAccount.create_subextension("12245","acvds").should=="/Subaccount/12245/acvds"
	end
end

