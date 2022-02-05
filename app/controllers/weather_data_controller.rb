class WeatherDataController < ApplicationController
    before_action :set_station

    def daily
        @measurements_list = GetMeasurementsListQuery.call(@station)
        GetLastWeatherQuery.call(@measurements_list)
        GetDailyWeatherQuery.call(@measurements_list)
    end

    def weekly
        @measurements_list = GetMeasurementsListQuery.call(@station)
        GetLastWeatherQuery.call(@measurements_list)
        GetWeeklyWeatherQuery.call(@measurements_list)
    end

    private

    def set_station
        @stations_list = Station.list
        if params[:station_id]
            @station = Station.find_by(influx_id: params[:station_id])
        else
            @station = Station.find_by(influx_id: @stations_list[0][1])
        end
    end
end
