module Plivo
    class Call
	@api_extension="/Call/"
	def self.create_subextension(*subs)
	    subs.unshift(@api_extension).join("/")
	end
	def self.details(params={})
	    Plivo.get @api_extension,:query=>params
	end

	def self.detail_from_record(record_id,params={})
	    Plivo.get self.create_subextension(record_id),:query=>params
	end

	def self.live(call_uuid=:all)
	    params={:status=>"live"}
	    call_uuid == :all ? Plivo.get(@api_extension,:query=>params): Plivo.get(self.create_subextension(call_uuid),:query=>params)
	end
	def self.make_call(params={})
	    Plivo.post @api_extension,{:body=>params.to_json}
	end

	def self.hangup(call_uuid=:all,params={})
	    call_uuid == :all ? Plivo.delete(@api_extension,:body=>params): Plivo.delete(self.create_subextension(call_uuid),:body=>params)
	end

	def self.transfer_call(call_uuid,params={})
	    Plivo.post self.create_subextension(call_uuid),:body=>params.to_json
	end

	def self.record(action,call_uuid,params={})
	    record_extension=self.create_subextension call_uuid,"Record"
	    case action
	    when :start
		Plivo.post record_extension,:body=>params.to_json
	    when :stop
		Plivo.delete record_extension,:body=>params
	    end
	end
	def self.play(action,call_uuid,params={})
	    play_extension=self.create_subextension call_uuid,"Play"
	    case action
	    when :start 
		Plivo.post play_extension,:body=>params.to_json
	    when :stop
		Plivo.delete play_extension,:body=>params
	    end
	end

	def self.speak(action,call_uuid,params={})
	    speak_extension=self.create_subextension call_uuid,"Speak"
	    case action
	    when :start
		Plivo.post speak_extension,:body=>params.to_json
	    when :stop
		Plivo.delete speak_extension,:body=>params
	    end
	end
	def self.send_digits(call_uuid,params={})
	    Plivo.post self.create_subextension(call_uuid,"DTMF"),:body=>params.to_json
	end


    end

    class Request

	@api_extension="/Request"
	def self.create_subextension(*subs)
	    subs.unshift(@api_extension).join("/")
	end
	def self.hangup_request(request_uuid,params={})
	    Plivo.delete self.create_subextension(request_uuid),:body=>params
	end
    end
end
