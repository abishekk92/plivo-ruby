module Plivo
    class Message

	@api_extension="/Message"
	def self.create_subextension(*subs)
	    subs.unshift(@api_extension).join("/")
	end
	def self.send(params={})
	    Plivo.get @api_extension,:query=>params
	end

	def self.list(params={})
	    Plivo.post @api_extension,:body=>params.to_json
	end

	def self.get(record_id,params={})
	    Plivo.post self.create_subextension(record_id),:body=>params.to_json
	end
    end
end
