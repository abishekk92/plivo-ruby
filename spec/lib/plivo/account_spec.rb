require_relative '../../spec_helper'
require 'plivo'
##DONOT RUN THIS YET
describe "Account" do
    before do
            @client=Plivo.authenticate ENV["auth_id"], ENV["auth_token"] 
    end
    it "should get all the details associated with the Account" do
        VCR.use_cassette "account/details" do
            response = @client::Account.details
            response.should_not be_empty 
        end
    end 

    it "should update the account with given parameters" do
        VCR.use_cassette "account/udpate" do
            response = @client::Account.update :city => "New York"
            response.should_not be_empty
        end
    end
end

describe "Pricing" do
    before do
            @client=Plivo.authenticate ENV["auth_id"], ENV["auth_token"] 
    end
    it "should get all the details about pricing" do
        VCR.use_cassette "pricing/details" do
            response = @client::Pricing.details
            response.should_not be_empty 
        end
    end 
end

describe "SubAccount" do
    before do
            @client=Plivo.authenticate ENV["auth_id"], ENV["auth_token"] 
    end
    it "should get all the details associated with the SubAccount" do
        VCR.use_cassette "subaccount/details" do
            response = @client::SubAccount.list
            response.should_not be_empty 
        end
    end 

    it "should create the subaccount with given parameters" do
        VCR.use_cassette "subaccount/create" do
            response = @client::SubAccount.create params={}
            response.should_not be_empty
        end
    end

    it "should get the sub account associated with the given sub account id" do
        VCR.use_cassette "subaccount/get" do
            response = @client::SubAccount.get :subauth_id => "some sub_auth id"
            response.should_not be_empty
        end
    end

    it "should update the sub account associated for the given sub account id" \
        "with given params" do
        VCR.use_cassette "subaccount/update" do
            response = @client::SubAccount.get :subauth_id => "some sub_auth id"
            response.should_not be_empty
        end
    end

    it "should delete the sub account associated with the given sub account id" do
        VCR.use_cassette "subaccount/delete" do
            response = @client::SubAccount.delete :subauth_id => "some sub_auth id"
            response.should_not be_empty
        end
    end
end
