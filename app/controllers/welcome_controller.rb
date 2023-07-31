class WelcomeController < ApplicationController
	def welcome
		@last_name = params[:name]
	end
end
