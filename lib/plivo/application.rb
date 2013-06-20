module Plivo
	class Application
		@api_extension='/Application'	
		def self.create_subextension(*subs)
			subs.unshift(@api_extension).join("/")
		end
		def self.list
			Plivo.get(@api_extension)
		end
		
		def self.create(params={})
			Plivo.post @api_extension,params
		end
		def self.get(app_id,params={})
			Plivo.get self.create_subextension(app_id),params
		end
		def self.update(params={})
			Plivo.post self.create_subextension(app_id),params

		end

		def self.delete(params={})
			Plivo.delete self.create_subextension(app_id),params
		end
	end
end
