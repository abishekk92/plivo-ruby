require_relative '../lib/plivo.rb'
include Plivo

response = Plivo::XML::Response.new

response.Dial 'action'=>'foobar','method'=>'GET' do|number| 
    number.Number body='919940728522','sendDigits'=>true 
end

print response.to_xml()
