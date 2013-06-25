require 'httparty'
require 'json'
require_relative 'plivo/application'
require_relative 'plivo/account'
require_relative 'plivo/call'
require_relative 'plivo/endpoint'
require_relative 'plivo/number'
require_relative 'plivo/record'
require_relative 'plivo/carrier'
require_relative 'plivo/message'
require_relative 'plivo/xml'
require_relative 'plivo/util'
require_relative 'plivo/conference'
#module HTTParty
#	require 'recursive-open-struct'
#	class Response
#		def to_fields
#			RecursiveOpenStruct.new(self,:recurse_over_arrays=>true)
#		end
#	end
#end

module Plivo
	include HTTParty
	attr_accessor :auth_id,:auth_token
	headers 'User-Agent' => 'RubyPlivo','Content-Type'=>'application/json'
	maintain_method_across_redirects true
	format :json
	
	def self.authenticate(auth_id,auth_token)
		self.base_uri "api.plivo.com/v1/Account/#{auth_id}"	
		self.basic_auth auth_id,auth_token
		self
	end
end 
