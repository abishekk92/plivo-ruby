module Plivo
	class IncomingCarrier

		@api_extension="/IncomingCarrier"
		def self.create_subextension(*subs)
			subs.unshift(@api_extension).join("/")
		end
		def self.list(params={})
			Plivo.get @api_extension,:query=>params
		end

		def self.create(params={})
			Plivo.post @api_extension,:body=>params.to_json
		end

		def self.get(carrier_id,params={})
			Plivo.get self.create_subextension(carrier_id),:query=>params
		end

		def self.update(carrier_id,params={})
			Plivo.post self.create_subextension(carrier_id),:body=>params.to_json
		end

		def self.delete(carrier_id,params={})
			Plivo.delete self.create_subextension(carrier_id),:body=>params
		end
	end
	class OutgoingCarrier

		@api_extension="/OutgoingCarrier"
		def self.create_subextension(*subs)
			subs.unshift(@api_extension).join("/")
		end
		def self.list(params={})
			Plivo.get @api_extension,:query=>params
		end

		def self.create(params={})
			Plivo.post @api_extension,:body=>params.to_json
		end

		def self.get(carrier_id,params={})
			Plivo.get self.create_subextension(carrier_id),:query=>params
		end

		def self.update(carrier_id,params={})
			Plivo.post self.create_subextension(carrier_id),:body=>params.to_json
		end

		def self.delete(carrier_id,params={})
			Plivo.delete self.create_subextension(carrier_id),:body=>params
		end
	end
	class OutgoingCarrierRouting

		@api_extension="/OutgoingCarrierRouting"
		def self.create_subextension(*subs)
			subs.unshift(@api_extension).join("/")
		end
		def self.list(params={})
			Plivo.get @api_extension,:query=>params
		end

		def self.create(params={})
			Plivo.post @api_extension,:body=>params.to_json
		end

		def self.get(routing_id,params={})
			Plivo.get self.create_subextension(routing_id),:query=>params
		end

		def self.update(routing_id,params={})
			Plivo.post self.create_subextension(routing_id),:body=>params.to_json
		end

		def self.delete(routing_id,params={})
			Plivo.delete self.create_subextension(routing_id),:body=>params
		end

	end
end
