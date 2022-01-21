WEATHER_PARAMS = {t: 'AHTx0_temperature_C', rh: 'AHTx0_humidity_Rh', p: 'BMP280_pressure_Pa',
                  pm1: 'ZPHS01B_pm1_ug/m3', pm25: 'ZPHS01B_pm25_ug/m3', pm10: 'ZPHS01B_pm10_ug/m3',
                  no2: 'ZPHS01B_no2_ppm', co: 'ZPHS01B_co_ppm', so2: 'ZE03-SO2_so2_ppm',
                  o3: 'ZPHS01B_o3_ppm', co2: 'ZPHS01B_co2_ppm', ch2o: 'ZPHS01B_ch2o_mg/m3'}

token = ENV["WEATHERMAN_INFLUX_TOKEN"]
org = ENV["WEATHERMAN_INFLUX_ORG"]
url = ENV["WEATHERMAN_INFLUX_URL"]

client = InfluxDB2::Client.new(url, token, precision: InfluxDB2::WritePrecision::NANOSECOND, use_ssl: false, org: org) 
READ_WEATHER_API = client.create_query_api