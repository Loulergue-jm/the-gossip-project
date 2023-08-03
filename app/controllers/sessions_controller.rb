class SessionsController < ApplicationController
  def new
    @session = session
  end

  def create
    user = User.find_by(email: params[:email])
    puts user
    if !user
      flash[:alert] = 'Utilisateur inconnu'
      redirect_to new_session_path

    elsif user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'Utilisateur connecté'
      redirect_to root_path
    else
      flash[:alert] = 'Mot de passe erroné'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
      redirect_to root_path
  end
end
