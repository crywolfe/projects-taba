class SessionController < ApplicationController

	def new
	end

	def create
    #find user
    user = User.find_by(email: params[:email])
    #ensure user is found and user is authenticated
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to(users_path) #instead of "/users"
    else
      render(:new)
    end
  end

  #delete the session when destroy method is called through Log Out
  def destroy
    session[:user_id] = nil
    redirect_to(root_path)
  end

end
