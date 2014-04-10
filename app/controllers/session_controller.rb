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

  def oauth
    verification_url = 'https://www.googleapis.com/oauth2/v1/tokeninfo'
    session[:google_access] = params[:code]
    redirect_to(users_path)
  end
end