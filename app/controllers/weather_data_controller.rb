class WeatherDataController < ApplicationController
    def index
        @data = GetLastWeatherQuery.call('ecocity_083AF26E4F10', WEATHER_PARAMS)
    end
end
