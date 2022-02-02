class WeatherDataController < ApplicationController
    def index
        @stations_list = Station.list
        if params[:station_id]
            @station = Station.find_by(influx_id: params[:station_id])
        else
            @station = Station.find_by(influx_id: @stations_list[0][1])
        end
        @measurements_list = GetMeasurementsListQuery.call(@station)
        GetLastWeatherQuery.call(@measurements_list)
    end
end
