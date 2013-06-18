module ApplicationHelper
	def blank_if(variable)
		variable.blank? ? '' : variable
	end
end
