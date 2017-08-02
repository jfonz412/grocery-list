module SessionsHelper

	#save user's id under the sessions hash stored on the browser by raisl
	def log_in(user)
		session[:user_id] = user.id
	end

	# look in the session hash for the user id
	# set it to current_user if current_user is nil
	def current_user
		if (user_id = session[:user_id]) #if you are able to assign this var
			@current_user ||= User.find_by(id: user_id) 
		elsif (user_id = cookies.signed[:user_id])
			raise
			user = User.find_by(id: user_id)
			# check the token in the cookie against the user's digest 
			if user && user.authenticated?(cookies[:remember_token]) # see user.rb
				log_in user
				@current_user = user
			end
		end
	end

	# check session hash for a user_id
	# returns true if one is found
	def logged_in?
	  !session[:user_id].nil?
	end

	def forget(user)
		user.forget
		cookies.delete(:user_id)
		cookies.delete(:remember_token)
	end

	# delete the user_id and set @current_user to nil
	def log_out
		if logged_in?
			forget(current_user)
	  	session.delete(:user_id)
	  	@current_user = nil
	  end
 	end

 	def remember(user)
 		user.remember
 		cookies.permanent.signed[:user_id] = user.id 
 		cookies.permanent[:remember_token] = user.remember_token
 	end
end
