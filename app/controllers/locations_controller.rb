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
        @location = Location.find(current_location.id)
    end

    def update
        location = Location.find(params[:id])
        new_name = params[:location][:name]
        location.update(name: new_name)
        # TODO: Location updates, but then reverts to old data

        redirect_to root_path
    end

    private

    def location_params
        params.require(:location).permit(:email, :name, :password, :password_confirmation)
    end

end