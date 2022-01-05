class LocationsController < ApplicationController
    before_action :authorized, only: [:show]

    def new
        @location = Location.new
    end

    def create
        @location = Location.create(location_params)
        if @location.valid?
            @location.save
            redirect_to @location
        else
            redirect :new
        end
    end

    def show
        @location = Location.find(params[:id])
    end

    private

    def location_params
        params.require(:location).permit(:email, :name, :password, :password_confirmation)
    end

end