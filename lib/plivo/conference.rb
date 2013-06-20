module Plivo
    class Conference

	@api_extension="/Conference"
	def self.create_subextension(*subs)
	    subs.unshift(@api_extension).join("/")
	end
	def self.list(params={})
	    Plivo.get @api_etension,params
	end

	def self.get_conference_by_conference_name(conference_name,params={})
	    Plivo.get self.create_subextension(conference_name),params 
	end
	def self.hangup(conference=:all,params={})
	    conference==:all ? Plivo.delete(@api_extension,params) : Plivo.delete(self.create_subextension(conference),params)
	end
	def self.hangup_member(conference_name,member_id,params={})
	    Plivo.delete self.create_subextension(conference_name,"Member",member_id),params
	end

	def self.play_for_member(action,conference_name,member_id,params={})
	    play_extension=self.create_subextension conference_name,"Member",member_id,"Speak"
	    case action
	    when :start
		Plivo.post play_extension,params
	    when :stop
		Plivo.delete play_extension,params
	    end
	end 
	def self.speak_member(conference_name,member_id,params={})
	    Plivo.post self.create_subextension(conference_name,"Member",member_id,"Speak"),params
	end

	def self.member(action,conference_name,member_id,params)

	    deaf_extension,mute_extension,kick_extension=*%w[Deaf Mute Kick].map { |endpoint| self.create_subextension conference_name,member_id,endpoint }
	    case action
	    when :deaf
		Plivo.post deaf_extension,params
	    when :un_deaf
		Plivo.delete deaf_member,params
	    when :mute
		Plivo.post mute_extension,params
	    when :unmute
		Plivo.delete mute_extension,params
	    when :kick
		Plivo.post kick_extension,params

	    end
	end 

	def self.record(action,conference_name,params={})
	    record_extension=self.create_subextension(conference_name,"Record")
	    case action
	    when :start
		Plivo.post record_extension,params
	    when :stop
		Plivo.delete record_extension,params

	    end

	end 

    end
end
