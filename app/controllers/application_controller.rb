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

  def render_noaccess
    render file: "public/no_access.html"
  end
  #def after_sign_in_path_for(resource)
  #current_user_path
  #end

  #def after_sign_out_path_for(resource_or_scope)
  #request.referrer
  #end



  before_action :configure_permitted_parameters, if: :devise_controller?

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :login
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :email) }
  end

  def check_if_admin
    unless admin?
      flash[:error] = "У Вас нету прав администаратора"
      redirect_to news_path
      false
    end
  end
    
    def admin?
     current_user == "denis.hudzenko@gmail.com"      
    end
            
  

end
