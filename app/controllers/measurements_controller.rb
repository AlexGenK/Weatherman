class MeasurementsController < ApplicationController
    before_action :set_station

    def index
    end

    private

    def set_station
        @station = Station.find(params[:station_id])
    end
end
