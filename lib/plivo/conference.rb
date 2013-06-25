module Plivo
    class Conference

	@api_extension="/Conference"
	def self.create_subextension(*subs)
	    subs.unshift(@api_extension).join("/")
	end
	def self.list(params={})
	    Plivo.get @api_extension,:query=>params
	end

	def self.get_conference_by_conference_name(conference_name,params={})
	    Plivo.get self.create_subextension(conference_name),:query=>params 
	end
	def self.hangup(conference=:all,params={})
	    conference==:all ? Plivo.delete(@api_extension,:body=>params) : Plivo.delete(self.create_subextension(conference),:body=>params)
	end
	def self.hangup_member(conference_name,member_id,params={})
	    Plivo.delete self.create_subextension(conference_name,"Member",member_id),:body=>params
	end

	def self.play_for_member(action,conference_name,member_id,params={})
	    play_extension=self.create_subextension conference_name,"Member",member_id,"Speak"
	    case action
	    when :start
		Plivo.post play_extension,:body=>params.to_json
	    when :stop
		Plivo.delete play_extension,:body=>params
	    end
	end 
	def self.speak_member(conference_name,member_id,params={})
	    Plivo.post self.create_subextension(conference_name,"Member",member_id,"Speak"),:body=>params.to_json
	end

	def self.member(action,conference_name,member_id,params={})

	    deaf_extension,mute_extension,kick_extension=*%w[Deaf Mute Kick].map { |endpoint| self.create_subextension conference_name,member_id,endpoint }
	    case action
	    when :deaf
		Plivo.post deaf_extension,:body=>params.to_json
	    when :un_deaf
		Plivo.delete deaf_member,:body=>params
	    when :mute
		Plivo.post mute_extension,:body=>params.to_json
	    when :unmute
		Plivo.delete mute_extension,:body=>params
	    when :kick
		Plivo.post kick_extension,:body=>params.to_json

	    end
	end 

	def self.record(action,conference_name,params={})
	    record_extension=self.create_subextension(conference_name,"Record")
	    case action
	    when :start
		Plivo.post record_extension,:body=>params.to_json
	    when :stop
		Plivo.delete record_extension,:body=>params

	    end

	end 

    end
end
