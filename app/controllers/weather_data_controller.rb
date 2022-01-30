class WeatherDataController < ApplicationController
    def index
        @stations_list = Station.list
        if params[:station_id]
            @station = Station.find_by(influx_id: params[:station_id])
        else
            @station = Station.find_by(influx_id: @stations_list[0][1])
        end
        @data = GetLastWeatherQuery.call(@station.influx_id, WEATHER_PARAMS)
    end
end
