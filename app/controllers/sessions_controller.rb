class SessionsController < ApplicationController
    def new
    end
  
    def create
      @location = Location.find_by(email: params[:email])
      if @location && @location.authenticate(params[:password])
        session[:location_id] = @location.id
        redirect_to @location
      else  
        redirect_to signin_path
      end
    end

    def destroy
        session[:location_id] = nil
        redirect_to signin_path
    end
  end