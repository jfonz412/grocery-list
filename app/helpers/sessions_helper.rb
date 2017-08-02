module SessionsHelper

	#save user's id under the sessions hash stored on the browser by raisl
	def log_in(user)
		session[:user_id] = user.id
	end

	# look in the session hash for the user id
	# set it to current_user if current_user is nil
	def current_user
		@current_user ||= User.find_by(id: session[:user_id]) 
	end

	# check session hash for a user_id
	# returns true if one is found
	def logged_in?
	    !session[:user_id].nil?
	end

	# delete the user_id and set @current_user to nil
	def log_out
	  	session.delete(:user_id)
	  	@current_user = nil
 	end
end
