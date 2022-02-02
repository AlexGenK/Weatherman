class GetLastWeatherQuery
    def self.call(mes_list)
        mes_list.each do |key, value|
            value.each do |item|
                item.get_now_val
            end
        end
    end
end