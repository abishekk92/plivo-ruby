module Plivo
	class Account 
		def self.account(params)
			Plivo.get '',params
		end

		def self.update(params)
			Plivo.post '',params
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
		def self.create
			Plivo.post @api_extension,params
		end

		def self.get(subauth_id,params={})
			Plivo.get self.create_subextension(subauth_id),params
		end 

		def self.update(subauth_id,params={})
			Plivo.post self.create_subextension(subauth_id),params
		end

		def self.delete(subauth_id,params={})
			Plivo.delete self.create_subextension(subauth_id),params
		end
	end
	class Pricing

		@api_extension="/Pricing"
		def self.create_subextension(*subs)
			subs.unshift(@api_extension).join("/")
		end
		def self.details(params={})
			Plivo.get @api_extension,params
		end 
	end

end