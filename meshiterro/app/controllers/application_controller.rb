class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :device_controller?
	protected
	def configure_permitted_parameters
		device_parameter_sanitizer.permit(:sign_up,keys:[:name])
	end
end
