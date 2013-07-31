
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
describe "Call" do
	before do
		@client=Plivo.authenticate ENV["auth_id"], ENV["auth_token"] 
	end

	it "should make a call to the given number" do
		response=@client::Call.make_call :from=>"19512977322",:to=>"19095210577",:answer_url=>"https://guarded-island.herokuapp.com/conference/"
		response["message"].should_not be_empty
	end

	it "should contain objects" do 
		response=@client::Call.details
		response.should have_key("objects") and response["objects"].should_not be_empty
	end
end
