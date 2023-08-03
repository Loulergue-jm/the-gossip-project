class UsersController < ApplicationController
	
	def show
		@user = User.find(params[:id])
	end
	def new
		@user = User.new
	end
	def create
		if params[:password]==params[:password2]
		session.delete(:user_id)
		@user = User.new(
			email: params[:email], 
			password: params[:password],
			first_name: params[:first_name],
			last_name: params[:last_name],
			description: params[:description],
			age: params[:age],
			city_id: params[:city_id]
		)
		if @user.save
			flash[:notice] = "Utilisateur ajouté"
			redirect_to root_path
		else flash.now[:alert] = error_string(@user)
			render :new
		end
		else
			flash[:alert] = "passwords différents"
			redirect_back_or_to root_path
		end
	end
	
end
