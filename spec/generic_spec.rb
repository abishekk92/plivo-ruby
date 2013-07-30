require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Generic" do
    before do

        @client=Plivo.authenticate 'MAMWY3MWMZZWI5YWQ5N2','MTM1YTM3Y2FiZjkxY2UwOTI2MDQwM2JhOTQ1YTg0'
    end
    it "should set auth_id and auth_ token " do
        VCR.use_cassette 'authenticate' do
            @client.should_not be_instance_of(NilClass)
        end
    end

    it "should set api_extension" do
        @client::Call.instance_variable_get(:@api_extension).should=="/Call/"
    end

    it "should create a sub extension" do
        @client::SubAccount.create_subextension("12245","acvds").should=="/Subaccount/12245/acvds"
    end
end

