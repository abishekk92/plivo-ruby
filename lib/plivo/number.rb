module Plivo
	class Number
		@api_extension="/Number"
		def self.create_subextension(*subs)
			subs.unshift(@api_extension).join("/")
		end

		def self.list(params={}) 
			Plivo.get @api_extension,:query=>params
		end

		def self.info(number,params={})
			Plivo.get self.create_subextension(number),:query=>params
		end
		def self.unrent(number,params={})
			Plivo.delete self.create_subextension(number),:query=>params
		end
		def self.link_application(number,params={})
			Plivo.post self.create_subextension(number),:body=>params.to_json
		end

		def self.unlink_application(params={})
			Plivo.post self.create_subextension(number),:body=>params.to_json
		end
	end
	class AvailableNumber
		@api_extension="/AvailableNumber"
		def self.create_subextension(*subs)
			subs.unshift(@api_extension).join("/")
		end
		def self.numbers(params={})
			Plivo.get @api_extension,:query=>params 
		end

		def self.number(number,params={})
			Plivo.get self.create_subextension(number),:query=>params
		end
	end

	class AvailableNumberGroup

		@api_extension="/AvailableNumberGroup"
		def self.create_subextension(*subs)
			subs.unshift(@api_extension).join("/")
		end
		def self.list(params={})
			Plivo.get @api_extension,:query=>params
		end

		def self.group_details(params={})
			Plivo.get self.create_subextension(group_id),:query=>params
		end

		def self.rent_from_group(group_id,params={})
			Plivo.get self.create_subextension(group_id),:query=>params
		end
	end
end
