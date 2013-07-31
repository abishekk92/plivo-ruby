require_relative '../../spec_helper'
require 'plivo'

describe "Call" do
    before do
        @client=Plivo.authenticate ENV["auth_id"], ENV["auth_token"] 
    end

    it "should make a call to the given number" do
        VCR.use_cassette "call/make_call" do
            response=@client::Call.make_call :from=>"19512977322",:to=>"19095210577",:answer_url=>"https://guarded-island.herokuapp.com/conference/"
            response["message"].should_not be_empty
        end
    end


    it "should contain objects" do 
        VCR.use_cassette "call/details" do
            response=@client::Call.details
            response.should have_key("objects") and response["objects"].should_not be_empty
        end
    end
end 
