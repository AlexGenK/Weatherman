class GetYearlyWeatherQuery
    def self.call(mes_list)
        mes_list.each do |key, value|
            value.each do |item|
                item.set_range_val(start: '-365d', every: '1d')
            end
        end
    end
end