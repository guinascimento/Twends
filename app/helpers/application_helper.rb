module ApplicationHelper
	def is_active?(action_name)
		"current" if params[:action] == action_name
	end
end
