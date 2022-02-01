class Measurement < ApplicationRecord
  belongs_to :station
  belongs_to :dimension

  def corrected(meas)
    self.coefficient||=1
    (meas+calibration)*coefficient
  end

  def get_color(meas)
    if (self.dimension.guideline==nil)||(self.dimension.guideline==0)
      return COLORS[:neutral]
    elsif meas <= self.dimension.guideline
      return COLORS[:safe]
    else
      return COLORS[:danger]
    end
  end
end
