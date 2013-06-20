module Plivo
    class IncomingCarrier

	@api_extension="/Conference"
	def self.create_subextension(*subs)
	    subs.unshift(@api_extension).join("/")
	end
	def self.list(params={})
	    Plivo.get @api_extension,params
	end

	def self.create(params={})
	    Plivo.post @api_extension,params
	end

	def self.get(carrier_id,params={})
	    Plivo.get self.create_subextension(carrier_id),params
	end

	def self.update(carrier_id,params={})
	    Plivo.post self.create_subextension(carrier_id),params
	end

	def self.delete(carrier_id,params={})
	    Plivo.delete self.create_subextension(carrier_id),params
	end
    end
    class CarrierRouting

	@api_extension="/CarrierRouting"
	def self.create_subextension(*subs)
	    subs.unshift(@api_extension).join("/")
	end
	def self.list(params={})
	    Plivo.get @api_extension,params
	end

	def self.create(params={})
	    Plivo.post @api_extension,params
	end

	def self.get(routing_id,params={})
	    Plivo.get self.create_subextension(routing_id),params
	end

	def self.update(routing_id,params={})
	    Plivo.post self.create_subextension(routing_id),params
	end

	def self.delete(routing_id,params={})
	    Plivo.delete self.create_subextension(routing_id),params
	end

    end
end
