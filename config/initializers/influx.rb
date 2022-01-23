WEATHER_PARAMS = {  t: {field: 'AHTx0_temperature_C', margin: 0},
                    rh: {field: 'AHTx0_humidity_Rh', margin: 0},
                    p: {field: 'BMP280_pressure_Pa', margin: 0},
                    pm1: {field: 'ZPHS01B_pm1_ug/m3', margin: 0},
                    pm25: {field: 'ZPHS01B_pm25_ug/m3', margin: 15},
                    pm10: {field: 'ZPHS01B_pm10_ug/m3', margin: 45},
                    no2: {field: 'ZPHS01B_no2_ppm', margin: 0.013},
                    co: {field: 'ZPHS01B_co_ppm', margin: 3.44},
                    so2: {field: 'ZE03-SO2_so2_ppm', margin: 0.015},
                    o3: {field: 'ZPHS01B_o3_ppm', margin: 0.050},
                    co2: {field: 'ZPHS01B_co2_ppm', margin: 0},
                    ch2o: {field: 'ZPHS01B_ch2o_mg/m3', margin: 0.1}}

token = ENV["WEATHERMAN_INFLUX_TOKEN"]
org = ENV["WEATHERMAN_INFLUX_ORG"]
url = ENV["WEATHERMAN_INFLUX_URL"]

client = InfluxDB2::Client.new(url, token, precision: InfluxDB2::WritePrecision::NANOSECOND, use_ssl: false, org: org) 
READ_WEATHER_API = client.create_query_api