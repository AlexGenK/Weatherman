class StationsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_station, only: [:edit, :update, :destroy]

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

    def edit
    end

    def update
        if @station.update(station_params)
            redirect_to stations_path
        else
            render :edit
        end
    end

    def destroy
        @station.destroy
        redirect_to stations_path
    end

    private

    def station_params
        params.require(:station).permit(:name, :address, :influx_id)
    end

    def set_station
        @station = Station.find(params[:id])
    end    
end
