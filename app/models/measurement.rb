class Measurement < ApplicationRecord
  belongs_to :station
  belongs_to :dimension

  attr_accessor :now_val
  attr_accessor :range_val

  def set_now_val
    records = READ_WEATHER_API.query_stream(query: 'from(bucket:"' + BUCKET + '") 
                                                    |> range(start: 1970-01-01T00:00:00.000000001Z) 
                                                    |> last() 
                                                    |> filter(fn: (r) => 
                                                      r._measurement == "' + self.station.influx_id + '" and 
                                                      r._field == "' + self.influx_id + '")')
    if records.first == nil
      self.now_val = nil
    else
      self.now_val = corrected(records.first.values["_value"])
    end
  end

  def set_range_val
    records = READ_WEATHER_API.query_stream(query: 'from(bucket:"' + BUCKET + '") 
                                                    |> range(start: -24h) 
                                                    |> filter(fn: (r) => 
                                                      r._measurement == "' + self.station.influx_id + '" and 
                                                      r._field == "' + self.influx_id + '")
                                                    |> aggregateWindow(every: 1h, fn: mean, createEmpty: false)')

    self.range_val = records.map{|i| [i.values['_time'].to_datetime.in_time_zone('Kyiv'), corrected(i.values['_value'])]}
  end

  def color
    if (self.dimension.guideline==nil)||(self.dimension.guideline==0)
      return COLORS[:neutral]
    elsif self.now_val <= self.dimension.guideline
      return COLORS[:safe]
    else
      return COLORS[:danger]
    end
  end

  private 

  def corrected(mes)
    if mes == nil
      return nil
    else
      self.coefficient||=1
      return (mes+self.calibration)*self.coefficient
    end 
  end
end
