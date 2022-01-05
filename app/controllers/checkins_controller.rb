class CheckinsController < ApplicationController
    def new
        @location = Location.find(params[:location_id])
        @checkin = Checkin.new
    end

    def create
        @location = Location.find(params[:location_id])
        @checkin = @location.checkins.create(checkin_params)
        redirect_to @checkin
    end

    def show
        @checkin = Checkin.find(params[:id])
    end

    private

    def checkin_params
        params.require(:checkin).permit(:first_name, :last_name, :identification, :temperature)
    end

end
