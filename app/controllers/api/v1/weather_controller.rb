module Api
    module V1
      class WeatherController < ActionController::Base
        def now
          @stations_list = Station.list
          @station = Station.find_by(influx_id: @stations_list[0][1])
          @measurements_list = GetMeasurementsListQuery.call(@station)
          GetLastWeatherQuery.call(@measurements_list)
          @now_weather = get_now_weather(@measurements_list)
          render json: @now_weather, status: :ok
        end

        private

        def get_now_weather(measurements_list)
          @now_weather=[]
          measurements_list.each do |group, group_val|
            group_val.each do |item|
              @now_weather << {name: item.dimension.name, value: item.now_val.round(2), color: item.color}
            end
          end
          @now_weather
        end
      end
    end
end