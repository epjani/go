class BaseController <  ActionController::Base
	before_filter :check_session

	def self.disable_layout_for_ajax(layout_name = 'application')
    	layout Proc.new { |controller| controller.request.xhr? ? nil : layout_name }    
  	end
  	
	private

	def check_session
		if session && params[:controller] == 'base' && params[:action] == 'index' && !session[:id].blank?
			p params[:controller]
			p params[:action]
			redirect_to nurse_dashboard_path(session[:id])
		end
	end
end