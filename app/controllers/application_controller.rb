class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_location

    def current_location
      if session[:location_id]
        @location = Location.find(session[:location_id])
      end
    end
  
    def logged_in?
      !!current_location
    end
  
    def authorized
      redirect_to signin_path unless logged_in?
    end
end
