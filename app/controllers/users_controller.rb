class UsersController < ApplicationController


	def index
		
		

	end

	def new
		@new_user = User.new
	end

#make create post route
	def create
		#create new_user variable using User.new (not user create)... to ensure a save based on validations
		@new_user = User.new(
			:name => params[:name],
      :email => params[:email],
      :password => params[:password],
      :password_confirmation => [:password_confirmation]
		)

		if @new_user.save
			redirect_to(root_path)

		else
			# flash[:error] = "You made an error. Do it again"
			render :new
			#there is another command here I can use...
		end


	end

	def edit
	end

	def show
	end


	# private

	# def user_params
 #    params.require(:user).permit(
 #      :name,
 #      :email,
 #      :password,
 #      :password_confirmation
 #    )
 #  end




end
