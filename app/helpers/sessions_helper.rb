module SessionsHelper
	def log_in(user)
		session[:user_id] = user.id
	end

	# look in the session hash for the user id
	def current_user
		@current_user ||= User.find_by(id: session[:user_id]) 
	end

	def logged_in?
	    !session[:user_id].nil?
	end

end
