require_relative '../lib/plivo.rb'

auth_id = ENV["auth_id"]
auth_token = ENV["auth_token"]

include Plivo

client=Plivo.authenticate(auth_id,auth_token)
#List all the applications registered with the account
applications=@client::Application.list
app_id=applications["objects"].first["app_id"]

#Get application by app_id
client::Application.get app_id
client::Call.live :all

#Get live call by call_uuid
client::Call.live(call_uuid="199525ea-d947-11e2-87ef-7b415004f6a6")
#Make an outbound call to a given number
client::Call.make_call :from=>"13239828795",:to=>"19513305344",:answer_url=>"http://example.com/Answer"
#Deaf/Undeaf a member in a conference room 
client::Conference.member action=:deaf,conference_name="plivo",member_id="123"

client::Conference.member action=:undeaf,conference_name="plivo",member_id="123"

#Mute/UnMute a member in a confernece
client::Conference.member action=:mute,conference_name="plivo",member_id="123"

client::Conference.member action=:unmute,conference_name="plivo",member_id="123"
#Kick a member out of the conference
client::Conference.member action=:kick,conference_name="plivo",member_id="123"

#Hangup all the conference
client::Conference.hangup :all

#Start/Stop recording a conference

client::Conference.record action=:start,conference_name="conference",member_id="123"

client::Conference.record action=:stop,conference_name="conference",member_id="123"


#To send an outbound message 
client::Message.send :src=>"13239828795",:dst=>"19513305344",:text=>"Hello there"
