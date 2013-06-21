require_relative '../lib/plivo.rb'
include Plivo::XML

response =XML::Response.new
##Direct Dial 
response.Dial 'action'=>'foobar','method'=>'GET' do|number| 
    number.Number body='919940728522','sendDigits'=>true 
end

#Creating a conference
conference_response=XML::Response.new

conference_response.Conference "Plivo",'method'=>'GET','startConferenceOnEnter'=>true,'record'=>true

XML::Response.new do |parent|
	parent.GetDigits 'action'=>'example.com/action_url','method'=>'POST','retries'=>2 do |child|
		child.Speak "Say something"
	end
end
