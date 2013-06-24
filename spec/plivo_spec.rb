require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Plivo" do
	before do

		@client=Plivo.authenticate 'some_id','some_token'
	end
	it "should set auth_id and auth_ token " do
		@client.should_not be_instance_of(NilClass)
	end

	it "should make a call to the given number" do
		response=@client::Call.make_call :from=>'somenumber',:to=>'somenunmber',:answer_url=>'someurl'
	end
end
