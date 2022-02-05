class GetWeeklyWeatherQuery
    def self.call(mes_list)
        mes_list.each do |key, value|
            value.each do |item|
                item.set_range_val(start: '-7d', every: '2h')
            end
        end
    end
end