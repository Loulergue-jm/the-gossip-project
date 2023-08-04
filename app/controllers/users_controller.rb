class UsersController < ApplicationController
	
	def show
		@user = User.find(params[:id])
	end
	def new
		@user = User.new
	end
	def create
		p "&" *50
		p params
		p params[:user]
		p "&" *50

		if params[:user][:password] == params[:user][:password_confirmation]
		session.delete(:user_id)
		@user = User.new(
			email: params[:user][:email], 
			password: params[:user][:password],
			first_name: params[:user][:first_name],
			last_name: params[:user][:last_name],
			description: params[:user][:description],
			age: params[:user][:age],
			city_id: params[:user][:city_id]
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