# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	def is_active?(action_name)
		"current" if params[:action] == action_name
	end
end
