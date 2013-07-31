require_relative '../../spec_helper'
require 'plivo'

describe "Account" do
    before do
            @client=Plivo.authenticate ENV["auth_id"], ENV["auth_token"] 
    end
    it "should get all the details associated with the Account" do
        VCR.use_casette "account/details" do
            response = @client::Account.details
            response.should_not be_empty 
        end
    end 

end
