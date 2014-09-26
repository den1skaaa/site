class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def render_404
	render file: "public/404.html", status: 404
  end

  def render_403
  	render file: "public/403.html", status: 403
  end

  def after_sign_in_path_for(resource)
  current_user_path
  end

  def after_sign_out_path_for(resource_or_scope)
  request.referrer
  end
  
end
