class GetLastWeatherQuery
    def self.call(station, mes_list)
        bucket = 'meteo'
        @meteo = {}

        mes_list.each do |key, value|
            @category = []
            value.each do |item|
                records = READ_WEATHER_API.query_stream(query: 'from(bucket:"' + bucket + '") 
                                                        |> range(start: 1970-01-01T00:00:00.000000001Z) 
                                                        |> last() 
                                                        |> filter(fn: (r) => 
                                                        r._measurement == "' + station.influx_id + '" and 
                                                        r._field == "' + item.influx_id + '")')
                next if records.first == nil
                measur={}
                measur[:name] = item.dimension.name
                measur[:value] = records.first.values["_value"]
                @category << measur
            end
            @meteo[key] = @category
        end
        return @meteo
    end
end