class Measurement < ApplicationRecord
  belongs_to :station
  belongs_to :dimension

  attr_accessor :now_val

  def corrected_now_val
    if now_val == nil
      return nil
    else
      self.coefficient||=1
      return (self.now_val+self.calibration)*self.coefficient
    end
  end

  def set_now_val
    records = READ_WEATHER_API.query_stream(query: 'from(bucket:"' + bucket + '") 
                                                    |> range(start: 1970-01-01T00:00:00.000000001Z) 
                                                    |> last() 
                                                    |> filter(fn: (r) => 
                                                      r._measurement == "' + self.station.influx_id + '" and 
                                                      r._field == "' + self.influx_id + '")')
    if records.first == nil
      self.now_val = nil
    else
      self.now_val = records.first.values["_value"]
    end
  end

  def color
    if (self.dimension.guideline==nil)||(self.dimension.guideline==0)
      return COLORS[:neutral]
    elsif self.corrected_now_val <= self.dimension.guideline
      return COLORS[:safe]
    else
      return COLORS[:danger]
    end
  end
end
