module Plivo
    class Recording

	@api_extension="/Conference"
	def self.create_subextension(*subs)
	    subs.unshift(@api_extension).join("/")
	end
	def self.list(params={})
	    Plivo.get @api_extension,:query=>params
	end

	def self.get_recording_by_id(recording_id,params={})
	    Plivo.get self.create_subextension(recording_id),:query=>params
	end
    end
end
