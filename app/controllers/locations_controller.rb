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
            redirect_to signup_path, flash: { error: "Some sign up info was wrong. Did you password match? Are all fields filled in?"}
        end
    end

    def show
        @location = Location.find(params[:id])
        checkin_url = location_checkin_url(@location, 'new')
        qrcode = RQRCode::QRCode.new(checkin_url)
        @svg = qrcode.as_svg(
            color: "000",
            shape_rendering: "crispEdges",
            module_size: 11,
            standalone: true,
            use_path: true
        )
    end

    def edit
        @location = current_location
    end

    def update
        pp params
        @location = Location.find(current_location.id)
        @location.update(name: params[:location][:name])
        redirect_to root_path
    end

    private

    def location_params
        params.require(:location).permit(:email, :name, :password, :password_confirmation)
    end

end