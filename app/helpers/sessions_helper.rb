module SessionsHelper

	#logs in the given user.
	def log_in(user)
		session[:user_id] = user.id
	end

	#return the current user object or nil if ther user does not exist
	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	#return true if the user is logged in, false otherwise
	def logged_in?
		!current_user.nil?
	end

	# Logs out the current user.
	def log_out
		session.delete(:user_id)
		@current_user = nil
	end
end