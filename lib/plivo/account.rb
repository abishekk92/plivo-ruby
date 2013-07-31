module Plivo
	class Account
	        @api_extension="/Account"	
		def self.details(params={})
			Plivo.get '',:query=>params
		end

		def self.update(params={})
			Plivo.post '',:body=>params.to_json
		end
	end
	class SubAccount 
		@api_extension="/Subaccount"
		def self.create_subextension(*subs)
			subs.unshift(@api_extension).join("/")
		end
		def self.list 
			Plivo.get @api_extension 
		end
		def self.create(params={})
			Plivo.post @api_extension,:body=>params.to_json
		end

		def self.get(subauth_id,params={})
			Plivo.get self.create_subextension(subauth_id),:query=>params
		end 

		def self.update(subauth_id,params={})
			Plivo.post self.create_subextension(subauth_id),:body=>params.to_json
		end

		def self.delete(subauth_id,params={})
			Plivo.delete self.create_subextension(subauth_id),:body=>params
		end
	end
	class Pricing

		@api_extension="/Pricing"
		def self.create_subextension(*subs)
			subs.unshift(@api_extension).join("/")
		end
		def self.details(params={})
			Plivo.get @api_extension,:query=>params
		end 
	end

end
