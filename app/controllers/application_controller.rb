class ApplicationController < ActionController::Base
	before_action :current_order

	def not_found
	    raise ActionController::RoutingError.new('Not Found')
	rescue
	    render file: "#{Rails.root}/public/404", status: :not_found
	end

	private
	def current_order
		if session[:order_id]
	  		order = Order.find_by(:id => session[:order_id])
	  		if order.present?
	  			@current_order = order
	  		else
	  			session[:order_id] = nil
	  		end
		end

		if session[:order_id] == nil
			@current_order = Order.create(user_id: current_user.id, completed_at: false)
	        @current_order.id = session[:order_id]
		end
	end
end
