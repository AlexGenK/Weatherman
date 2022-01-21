class GetLastWeatherQuery
	def self.call(measurement, fields)
        bucket = 'meteo'
        meteo = {}

        fields.each do |key, value|
            records = READ_WEATHER_API.query_stream(query: 'from(bucket:"' + bucket + '") 
                                                    |> range(start: 1970-01-01T00:00:00.000000001Z) 
                                                    |> last() 
                                                    |> filter(fn: (r) => 
                                                    r._measurement == "' + measurement + '" and 
                                                    r._field == "' + value + '")')
            records.each do |record|
                meteo[key] = record.values["_value"]
            end
        end

        return meteo
    end
end