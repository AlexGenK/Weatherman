class StationsController < ApplicationController
    before_action :set_station, only: [:edit, :update, :destroy, :show]

    def index
        @stations = Station.order(:name)
    end

    def new
        @station = Station.new
    end

    def create
        @station = Station.new(station_params)
        if @station.save
            redirect_to stations_path
        else
            render :new
        end
    end

    private

    def station_params
        params.require(:station).permit(:name, :address, :influx_id)
    end

    def set_station
        @station = Station.find(params[:id])
    end    
end