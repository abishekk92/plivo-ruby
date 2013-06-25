module Plivo
    class Endpoint

	@api_extension="/Conference"
	def self.create_subextension(*subs)
	    subs.unshift(@api_extension).join("/")
	end
	@api_extension="/Endpoint"
	def self.list(params={})
	    Plivo.get @api_extension,:query=>params
	end

	def self.create(params={})
	    Plivo.post @api_extension,:body=>params.to_json
	end

	def self.get(endpoint_id,params={})
	    Plivo.get self.create_subextension(endpoint_id),:query=>params
	end

	def self.update(endpoint_id,params={})
	    Plivo.post self.create_subextension(endpoint_id),:body=>params.to_json
	end

	def self.delete(endpoint_id,params={})
	    Plivo.delete self.create_subextension(endpoint_id),:body=>params
	end
    end
end
