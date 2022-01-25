class StationsController < ApplicationController
    before_action :set_station, only: [:edit, :update, :destroy, :show]

    def index
    end

    private

    def station_params
        params.require(:station).permit(:name, :address, :influx_id)
    end

    def set_station
        @station = Station.find(params[:id])
    end    
end
