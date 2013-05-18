class ApplicationController < BaseController
	before_filter :login_required
  	protect_from_forgery

  	
  	private

	def login_required

	    @current_nurse = Nurse.find(session[:id]) if (@current_nurse.nil? && session[:id])

	    # denied if user not found OR we found user but doens have secure cookie
	    if (@current_nurse.nil?)
	      access_denied
	      return false
    	end
    end

    def access_denied
	    if (request.xhr?)
	      #418 I'm a teapot -  This code was defined in 1998 as one of the traditional IETF April Fools' jokes, in RFC 2324, Hyper Text Coffee Pot Control Protocol, and is not expected to be implemented by actual HTTP servers.
	      self.class.layout Proc.new { |controller| nil }    
	      render :status => 418 
	    else
	      redirect_to '/'
	    end
  	end
end
