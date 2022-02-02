token = ENV["WEATHERMAN_INFLUX_TOKEN"]
org = ENV["WEATHERMAN_INFLUX_ORG"]
url = ENV["WEATHERMAN_INFLUX_URL"]
BUCKET = 'meteo'

client = InfluxDB2::Client.new(url, token, precision: InfluxDB2::WritePrecision::NANOSECOND, use_ssl: false, org: org) 
READ_WEATHER_API = client.create_query_api