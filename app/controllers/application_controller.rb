class ApplicationController < ActionController::Base
	include SessionHelper
	
	def error_string(object_to_error)
		message_array=[]
		object_to_error.errors.full_messages.each do |msg|
		message_array << msg
		end
		message_array.join("; ")
	end
end
