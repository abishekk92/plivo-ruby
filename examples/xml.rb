require_relative '../lib/plivo.rb'
include Plivo::XML

response = Response.new
##Direct Dial 
response.Dial 'action'=>'foobar','method'=>'GET' do|number| 
    number.Number body='919940728522','sendDigits'=>true 
end

#Creating a conference
conference_response = Response.new

conference_response.Conference "Plivo",'method'=>'GET','startConferenceOnEnter'=>true,'record'=>true

Response.new do |parent|
	parent.GetDigits 'action'=>'example.com/action_url','method'=>'POST','retries'=>2 do |child|
		child.Speak "Say something"
	end
end
