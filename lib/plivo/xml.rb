require 'rexml/document'
module Plivo
	module XML
		class PlivoError < Exception

		end
		class Element
			class << self 
				attr_accessor :valid_attributes, :nestables
			end 
			@nestables = []
			@valid_attributes = []

			attr_accessor :node, :name

			def initialize(body=nil, attributes={}, &block)
				@name = self.class.name.split('::')[-1]
				@body = body
				@node = REXML::Element.new @name
				attributes.each do |k, v|
					if self.class.valid_attributes.include?(k.to_s)
						@node.attributes[k.to_s] = convert_value(v)
					else
						raise PlivoError, "invalid attribute #{k.to_s} for #{@name}"
					end
				end
				if @body
					@node.text = @body
				end

				# Allow for nested "nestable" elements using a code block
				# ie
				# Plivo::Response.new do |r|
				#   r.Dial do |n|
				#     n.Number '+15557779999'
				#   end
				# end
				yield(self) if block_given?
			end

			def method_missing(method, *args, &block)
				# Handle the addElement methods
				#method = $1.to_sym if method.to_s =~ /^add(.*)/
				#method = method.to_sym if Plivo.const_defined? method.to_sym 
				# Add the element
				add(Plivo::XML.const_get(method.to_sym).new(*args, &block))
			end


			def convert_value(value)
				case value
				when true,false
					value.to_s
				when *%w[get post]
					value.upcase
				when nil
					"none"
				else 
					value
				end 
			end

			def add(element)
				if not element
					raise PlivoError, "invalid element"
				end
				if self.class.nestables.include?(element.name)
					@node.elements << element.node
					return element
				else
					raise PlivoError, "#{element.name} not nestable in #{@name}"
				end
			end

			def to_xml
				return @node.to_s
			end

			def to_s
				return @node.to_s
			end
		end


		class Response < Element
			@nestables = ['Speak', 'Play', 'GetDigits', 'Record', 'Dial', 'Message',
				'Redirect', 'Wait', 'Hangup', 'PreAnswer', 'Conference', 'DTMF']
			@valid_attributes = []

			def initialize()
				super(nil, {})
			end

			def to_xml()
				return '<?xml version="1.0" encoding="utf-8" ?>' + super()
			end

			def to_s()
				return '<?xml version="1.0" encoding="utf-8" ?>' + super()
			end
		end


		class Speak < Element
			@nestables = []
			@valid_attributes = ['voice', 'language', 'loop']

			def initialize(body, attributes={})
				if not body
					raise PlivoError, 'No text set for Speak'
				end
				super(body, attributes)
			end
		end


		class Play < Element
			@nestables = []
			@valid_attributes = ['loop']

			def initialize(body, attributes={})
				if not body
					raise PlivoError 'No url set for Play'
				end
				super(body, attributes)
			end
		end


		class Wait < Element
			@nestables = []
			@valid_attributes = ['length', 'silence', 'min_silence']

			def initialize(attributes={})
				super(nil, attributes)
			end
		end


		class Redirect < Element
			@nestables = []
			@valid_attributes = ['method']

			def initialize(body, attributes={})
				if not body
					raise PlivoError 'No url set for Redirect'
				end
				super(body, attributes)
			end
		end


		class Hangup < Element
			@nestables = []
			@valid_attributes = ['schedule', 'reason']

			def initialize(attributes={})
				super(nil, attributes)
			end
		end


		class GetDigits < Element
			@nestables = ['Speak', 'Play', 'Wait']
			@valid_attributes = ['action', 'method', 'timeout', 'digitTimeout',
				'numDigits', 'retries', 'invalidDigitsSound',
				'validDigits', 'playBeep', 'redirect', "finishOnKey",
				'digitTimeout']

			def initialize(attributes={}, &block)
				super(nil, attributes, &block)
			end
		end


		class Number < Element
			@nestables = []
			@valid_attributes = ['sendDigits', 'sendOnPreanswer']

			def initialize(body, attributes={})
				if not body
					raise PlivoError, 'No number set for Number'
				end
				super(body, attributes)
			end
		end


		class User < Element
			@nestables = []
			@valid_attributes = ['sendDigits', 'sendOnPreanswer', 'sipHeaders']

			def initialize(body, attributes={})
				if not body
					raise PlivoError, 'No user set for User'
				end
				super(body, attributes)
			end
		end


		class Dial < Element
			@nestables = ['Number', 'User']
			@valid_attributes = ['action','method','timeout','hangupOnStar',
				'timeLimit','callerId', 'callerName', 'confirmSound',
				'dialMusic', 'confirmKey', 'redirect',
				'callbackUrl', 'callbackMethod', 'digitsMatch',
				'sipHeaders']

			def initialize(attributes={}, &block)
				super(nil, attributes, &block)
			end
		end


		class Conference < Element
			@nestables = []
			@valid_attributes = ['muted','beep','startConferenceOnEnter',
				'endConferenceOnExit','waitSound','enterSound', 'exitSound',
				'timeLimit', 'hangupOnStar', 'maxMembers',
				'record', 'recordFileFormat', 'action', 'method', 'redirect',
				'digitsMatch', 'callbackUrl', 'callbackMethod',
				'stayAlone', 'floorEvent',
				'transcriptionType', 'transcriptionUrl',
				'transcriptionMethod']

			def initialize(body, attributes={})
				if not body
					raise PlivoError, 'No conference name set for Conference'
				end
				super(body, attributes)
			end
		end


		class Record < Element
			@nestables = []
			@valid_attributes = ['action', 'method', 'timeout','finishOnKey',
				'maxLength', 'playBeep', 'recordSession',
				'startOnDialAnswer', 'redirect', 'fileFormat',
				'callbackUrl', 'callbackMethod',
				'transcriptionType', 'transcriptionUrl',
				'transcriptionMethod']

			def initialize(attributes={})
				super(nil, attributes)
			end
		end


		class PreAnswer < Element
			@nestables = ['Play', 'Speak', 'GetDigits', 'Wait', 'Redirect', 'Message', 'DTMF']
			@valid_attributes = []

			def initialize(attributes={}, &block)
				super(nil, attributes, &block)
			end
		end


		class Message < Element
			@nestables = []
			@valid_attributes = ['src', 'dst', 'type', 'callbackUrl', 'callbackMethod']

			def initialize(body, attributes={})
				if not body
					raise PlivoError, 'No text set for Message'
				end
				super(body, attributes)
			end
		end  

		class DTMF < Element
			@nestables = []
			@valid_attributes = []

			def initialize(body, attributes={})
				if not body
					raise PlivoError, 'No digits set for DTMF'
				end
				super(body, attributes)
			end
		end
	end 
end 

