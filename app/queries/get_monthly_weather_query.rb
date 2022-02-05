class GetMonthlyWeatherQuery
    def self.call(mes_list)
        mes_list.each do |key, value|
            value.each do |item|
                item.set_range_val(start: '-30d', every: '12h')
            end
        end
    end
end