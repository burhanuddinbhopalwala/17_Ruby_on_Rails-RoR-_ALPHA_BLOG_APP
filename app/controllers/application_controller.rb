class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in? 
  # so that rails makes it available to use in all the views and not only in controllers
  
  def current_user()
    # optimization using memoization
    @current_user ||= User.find_by_id(session[:user_id]) if(session[:user_id])
    # User.find(id) => will not return nil else throw exception on RecordNotFound
  end 

  def logged_in?()
    !!current_user # True if exist else False
  end 

  def require_user()
    if(!logged_in?())
      flash[:danger] = "You need to be logged in to perform this action"
      redirect_to(root_path())
    end 
  end 
end
